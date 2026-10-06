import 'package:nectaar/core/resources/api_constants.dart';
import 'package:nectaar/core/services/server_gate.dart';

import '../data/models/login_input_model.dart';

class LoginService {
  Future<CustomResponse<Map<String, dynamic>>> login(LoginInputModel input) =>
      ServerGate.i.sendToServer<Map<String, dynamic>>(
        url: ApiConstants.authLogin,
        body: input.toJson(),
      );
}
