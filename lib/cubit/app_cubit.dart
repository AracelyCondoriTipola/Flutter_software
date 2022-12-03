import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/dto/login_response_dto.dart';
import 'package:frontend_app/service/login_service.dart';

class AppState {
  final bool isUserLoggedIn;
  final bool isLoading;
  final LoginResponseDto? loginResponseDto;

  AppState(
      {required this.isUserLoggedIn,
      required this.isLoading,
      this.loginResponseDto});
}

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState(isUserLoggedIn: false, isLoading: false));

  // Logica de negocio para hacer el login contra backend
  void login(String username, String password) async {
    emit(AppState(isUserLoggedIn: false, isLoading: true));

    try {
      var loginResponseDto = await LoginService.login(username, password);

      emit(AppState(
          isUserLoggedIn: true,
          isLoading: false,
          loginResponseDto: loginResponseDto));
    } catch (error) {
      emit(AppState(isUserLoggedIn: false, isLoading: false));
    }
  }
}
