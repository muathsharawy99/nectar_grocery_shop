import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectaar/view_model/bloc/signup_cubit/signup_state.dart';
import 'package:nectaar/view_model/network/dio_helper/dio_helper.dart';
import 'package:nectaar/view_model/network/dio_helper/end_points.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(InitState());

  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  static SignupCubit get(context) => BlocProvider.of<SignupCubit>(context);
  bool secure = true;

  void obsecurePassword() {
    secure = !secure;
    emit(ObsecureState());
  }

  void register  () async {
    emit(SignUpLoadingState());
    DioHelper.post(endPoint: EndPoints.register, data: {
      "name": usernameController.text,
      "email": emailController.text,
      "password": passwordController.text
    }).then((value) {

      print("Done");
      emit(
        SignUpSuccessState(),
      );
    }).catchError((onError) {
      if (onError is DioError) {
        print(onError.response?.data["message"].toString() ?? "");
      }
      emit(
        SignUpErrorState(),
      );
    });
  }
}
