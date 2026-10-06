import 'package:nectaar/core/resources/api_constants.dart';
import 'package:nectaar/core/services/server_gate.dart';

import '../data/models/register_input_model.dart';

class RegisterService {
  Future<CustomResponse<Map<String, dynamic>>> register(
    RegisterInputModel input,
  ) => ServerGate.i.sendToServer<Map<String, dynamic>>(
    url: ApiConstants.authRegister,
    body: input.toJson(),
  );
}
