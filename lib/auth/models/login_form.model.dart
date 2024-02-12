import 'package:flutter_vgv_arch/auth/auth.dart';

export 'package:formz/formz.dart';

class LoginForm with FormzMixin {
  const LoginForm({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final Email email;
  final Password password;
  final FormzSubmissionStatus status;

  LoginForm copyWith({
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
  }) {
    return LoginForm(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  LoginForm setEmail(Email? email) => copyWith(email: email);
  LoginForm setPassword(Password? password) => copyWith(password: password);

  LoginForm fromState(AuthState state) {
    final status = switch (state) {
      InitialAuthState() => FormzSubmissionStatus.initial,
      LoadingAuthState() => FormzSubmissionStatus.inProgress,
      FailureAuthState() => FormzSubmissionStatus.failure,
      ErrorAuthState() => FormzSubmissionStatus.canceled,
      AuthenticatedAuthState() => FormzSubmissionStatus.success,
    };

    return copyWith(status: status);
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [email, password];

  @override
  String toString() =>
      '${email.value} ${password.value} ${status.name} $isValid';
}

enum EmailValidationError {
  invalid('Please ensure the email entered is valid'),
  empty('Please enter an email');

  const EmailValidationError(this.text);

  final String text;
}

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure([super.value = '']) : super.pure();

  const Email.dirty(super.value) : super.dirty();

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&`*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidationError.empty;
    } else if (!_emailRegExp.hasMatch(value)) {
      return EmailValidationError.invalid;
    }

    return null;
  }
}

enum PasswordValidationError {
  invalid('Password must be at least 6 characters'),
  empty('Please enter a password');

  const PasswordValidationError(this.text);

  final String text;
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([super.value = '']) : super.pure();

  const Password.dirty(super.value) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    } else if (value.length < 6) {
      return PasswordValidationError.invalid;
    }

    return null;
  }
}
