import 'package:flutter_vgv_arch/auth/failures/auth_failure.dart';
import 'package:flutter_vgv_arch/shared/shared.dart';

sealed class AuthState {
  const AuthState();

  factory AuthState.initial() => const InitialAuthState();

  factory AuthState.loading() => const LoadingAuthState();

  factory AuthState.authenticated(User user) => AuthenticatedAuthState(user);

  factory AuthState.failure(AuthFailure failure) => FailureAuthState(failure);

  factory AuthState.error() => const ErrorAuthState();

  AuthStateValues get state {
    final state = switch (this) {
      InitialAuthState() => AuthStateValues.idle,
      LoadingAuthState() => AuthStateValues.loading,
      AuthenticatedAuthState() => AuthStateValues.authenticated,
      FailureAuthState() => AuthStateValues.failure,
      ErrorAuthState() => AuthStateValues.loading,
    };

    return state;
  }
}

enum AuthStateValues {
  idle,
  loading,
  authenticated,
  failure,
  error;
}

class InitialAuthState extends AuthState {
  const InitialAuthState();
}

class LoadingAuthState extends AuthState {
  const LoadingAuthState();
}

class AuthenticatedAuthState extends AuthState {
  const AuthenticatedAuthState(this.user);
  final User user;
}

class FailureAuthState extends AuthState {
  const FailureAuthState(this.failure);
  final AuthFailure failure;
}

class ErrorAuthState extends AuthState {
  const ErrorAuthState();
}
