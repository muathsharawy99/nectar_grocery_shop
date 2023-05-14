import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectaar/model/user_model.dart';
import 'package:nectaar/view_model/bloc/login_cubit/login_state.dart';
import 'package:nectaar/view_model/local/shared_preferences/shared_preferences_key.dart';
import 'package:nectaar/view_model/network/dio_helper/dio_helper.dart';
import 'package:nectaar/view_model/network/dio_helper/end_points.dart';

import '../../local/shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitState());

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  UserModel? userModel;

  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  bool secure = true;

  void obsecurePassword() {
    secure = !secure;
    emit(ObsecureState());
  }

  void login() async {
    emit(LoginLoadingState());
    DioHelper.post(
      endPoint: EndPoints.login,
      data: {
        "email": emailController.text,
        "password": passwordController.text,
      },
    ).then(
      (value) {
        print(value.data["code"]);
        if(value.data['code'] == 200 || value.data['code'] == 201) {
          userModel = UserModel.fromJson(value.data);
          SharedPreference.set(SharedKeys.token, userModel?.token);
          print(SharedPreference.get(SharedKeys.token));
          print("Hi then");
          emit(LoginSuccessState());
        }else{
          emit(LoginErrorState());
          throw 'Error On Login';
        }
      },
    ).catchError(
      (onError) {
        if (onError is DioError) {
          print(onError.response?.data["message"].toString() ?? "Dio Error");
          print ("Hi Error");
          emit(LoginErrorState());
        }
        throw onError;
      },
    );
  }
}
