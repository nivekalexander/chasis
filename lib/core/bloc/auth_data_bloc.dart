import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/auth_service.dart';

class AuthEvent {}

class AuthState {
  final bool isAuthenticated;
  final String? userToken;

  AuthState({this.isAuthenticated = false, this.userToken});
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc(this.authService) : super(AuthState());

  // 📌 Carga el token almacenado para saber si el usuario está autenticado
  Future<void> loadToken() async {
    String? token = await authService.getToken();
    if (token != null) {
      emit(AuthState(isAuthenticated: true, userToken: token));
    } else {
      emit(AuthState(isAuthenticated: false, userToken: null));
    }
  }
}
