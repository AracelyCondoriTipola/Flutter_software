// Un DTO significa Data Transfer Object
// Tambien puede ser llamado VO que significa Value Object
// En este caso, es un DTO porque es un objeto que se usa para transferir datos
// En java puede llamarse POJO (Plain Old Java Object)
// NO TIENEN LOGICA DE NEGOCIO

class LoginResponseDto {
  final String? token;
  final String? refreshToken;
  final String firstName;
  final String lastName;

  LoginResponseDto(
      {required this.token,
      required this.refreshToken,
      required this.firstName,
      required this.lastName});

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return LoginResponseDto(
      token: json['token'],
      refreshToken: json['refreshToken'],
      firstName: json['firstname'],
      lastName: json['lastName'],
    );
  }
}