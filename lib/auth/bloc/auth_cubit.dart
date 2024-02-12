import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vgv_arch/auth/auth.dart';
import 'package:flutter_vgv_arch/auth/data/auth_repository.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc({required this.repository}) : super(AuthState.initial());

  final AuthRepository repository;

  Future<void> login(LoginForm loginForm) async {
    emit(AuthState.loading());
    try {
      final result = await repository.login(loginForm);

      result.fold(
        (user) => emit(AuthState.authenticated(user)),
        (failure) => emit(AuthState.failure(failure)),
      );
    } on Exception {
      emit(AuthState.error());
    }
  }
}
