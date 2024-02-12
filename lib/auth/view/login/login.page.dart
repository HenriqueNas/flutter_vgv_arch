import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vgv_arch/app/routes.dart';
import 'package:flutter_vgv_arch/auth/auth.dart';
import 'package:flutter_vgv_arch/auth/data/auth_repository.dart';
import 'package:flutter_vgv_arch/auth/view/login/login.controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => AuthBloc(repository: const MockAuthRepository()),
        child: const _LoginView(),
      );
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  late final LoginController controller = LoginController(
    authBloc: context.read<AuthBloc>(),
  );

  @override
  void initState() {
    super.initState();
    controller.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void listenAuthState(BuildContext context, AuthState state) {
    controller.state = controller.state.fromState(state);

    if (state is AuthenticatedAuthState) {
      Navigator.of(context).pushNamed(Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: listenAuthState,
      child: BlocBuilder(
        bloc: controller,
        builder: (context, state) => Scaffold(
          body: Form(
            key: controller.key,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      helperText: 'A valid email e.g. john.doe@mail.com',
                    ),
                    validator: (value) =>
                        controller.state.email.validator(value ?? '')?.text,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: controller.passwordController,
                    decoration: const InputDecoration(
                      helperMaxLines: 2,
                      labelText: 'Password',
                      errorMaxLines: 2,
                    ),
                    validator: (value) =>
                        controller.state.password.validator(value ?? '')?.text,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: controller.state.isValid //
                        ? controller.onSubmit
                        : null,
                    child: controller.state.status.isInProgress
                        ? const SizedBox.square(
                            dimension: 20,
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
