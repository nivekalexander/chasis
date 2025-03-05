import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthEvent {}

class CheckSession extends AuthEvent {}

class LogoutEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {}

abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {}

class Unauthenticated extends AuthState {}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<CheckSession>((event, emit) {
      final isLogged =
          false; // Simulación de sesión (cambiar por almacenamiento real)
      if (isLogged) {
        emit(Authenticated());
      } else {
        emit(Unauthenticated());
      }
    });

    on<LoginEvent>((event, emit) {
      emit(Authenticated());
    });

    on<LogoutEvent>((event, emit) {
      emit(Unauthenticated());
    });
  }
}
