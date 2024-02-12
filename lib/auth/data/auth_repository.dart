import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_vgv_arch/auth/auth.dart';
import 'package:flutter_vgv_arch/auth/failures/auth_failure.dart';

import 'package:flutter_vgv_arch/shared/shared.dart';

abstract class AuthRepository {
  FutureOr<Either<User, AuthFailure>> login(LoginForm loginForm);

  FutureOr<Either<bool, AuthFailure>> recoverPassword({required String email});

  FutureOr<void> logout();

  FutureOr<Either<User, AuthFailure>> register(LoginForm registerModel);
}

class MockAuthRepository implements AuthRepository {
  const MockAuthRepository();

  @override
  Future<Either<User, AuthFailure>> login(LoginForm loginForm) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    final isEmailValid = loginForm.email.value == _MockValues.validEmail;
    final isPasswordValid =
        loginForm.password.value == _MockValues.validPassword;

    if (isEmailValid && isPasswordValid) {
      return left(
        User(
          id: '1',
          email: loginForm.email.value,
          name: 'John Doe',
          avatarUrl: 'https://via.placeholder.com/150',
        ),
      );
    } else {
      return right(AuthFailure.invalidCredentials());
    }
  }

  @override
  Future<Either<bool, AuthFailure>> recoverPassword({
    required String email,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    final isEmailValid = email == _MockValues.validEmail;

    if (isEmailValid) {
      return left(true);
    } else {
      return right(UserNotFound(email));
    }
  }

  @override
  void logout() => throw UnimplementedError();

  @override
  Either<User, AuthFailure> register(LoginForm registerModel) =>
      throw UnimplementedError();
}

class _MockValues {
  static const validEmail = 'john.doe@mail.com';
  static const validPassword = '123456';
}
