// Las clases Service únicamente realizan solicitudes REST al Backend.
import 'package:frontend_app/dto/login_response_dto.dart';

class LoginService {
  static Future<LoginResponseDto> login(
      String username, String password) async {
    if (username == "jperes" && password == "123456") {
      return LoginResponseDto(
          token: "ey123hg123h123.12h323.adasd",
          refreshToken: "ey123hg123h123.12h323.adasd",
          firstName: "juan",
          lastName: "Perez");
    } else {
      throw Exception("Credenciales invalidas");
    }
  }
}
