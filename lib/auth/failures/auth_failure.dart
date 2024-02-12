sealed class AuthFailure implements Exception {
  const AuthFailure([String? reason])
      : reason = reason ?? 'A Auth Failure occurred.';

  factory AuthFailure.invalidCredentials() => const WrongEmailOrPassword();

  final String reason;
}

class WrongEmailOrPassword extends AuthFailure {
  const WrongEmailOrPassword() : super('Wrong email or password');
}

class UserNotFound extends AuthFailure {
  const UserNotFound([String? userName])
      : super('User ${userName ?? ''} not found');
}

class UserDisabled extends AuthFailure {
  const UserDisabled([String? userName])
      : super('This user ${userName ?? ''} is disabled');
}

class MaximumAttemptsExceeded extends AuthFailure {
  const MaximumAttemptsExceeded()
      : super('The maximum attempts to login has been exceeded');
}
