import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vgv_arch/auth/auth.dart';

class LoginController extends Cubit<LoginForm> {
  LoginController({
    required this.authBloc,
  }) : super(const LoginForm());

  final AuthBloc authBloc;
  final key = GlobalKey<FormState>();

  late final emailController = TextEditingController(text: state.email.value);
  late final passwordController = TextEditingController(
    text: state.password.value,
  );

  bool get isFormValid => state.isValid;

  set state(LoginForm state) {
    emit(state);
  }

  Future<void> login() async => authBloc.login(
        LoginForm(
          email: Email.pure(emailController.text),
          password: Password.pure(emailController.text),
        ),
      );

  void _onEmailChanged() {
    emit(state.setEmail(Email.dirty(emailController.text)));
  }

  void _onPasswordChanged() {
    emit(state.setPassword(Password.dirty(passwordController.text)));
  }

  Future<void> onSubmit() async {
    if (key.currentState == null || !key.currentState!.validate()) {
      emit(state.copyWith(status: FormzSubmissionStatus.canceled));
      return;
    }

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      await authBloc.login(state);
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }

    if (!state.status.isSuccess) _resetForm();
  }

  void _resetForm() {
    key.currentState?.reset();
    emailController.clear();
    passwordController.clear();
    emit(const LoginForm());
  }

  void initState() {
    emailController.addListener(_onEmailChanged);
    passwordController.addListener(_onPasswordChanged);
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
