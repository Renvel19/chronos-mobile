import 'package:chronos_mobile/ui/bloc/cubit/login/login_cubit.dart';
import 'package:chronos_mobile/ui/widgets/input/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.watch<LoginFormCubit>();
    final username = loginCubit.state.username;
    final password = loginCubit.state.password;

    return Form(
      child: Column(
        children: [
          const SizedBox(height: 22),
          CustomTextFormField(
            label: 'Nombre de usuario',
            icon: Icons.person_outline,
            onChange: (value) => loginCubit.usernameChanged(value),
            errorMessage: username.errorMessage,
          ),
          const SizedBox(height: 35),
          CustomTextFormField(
            label: 'Contraseña',
            icon: Icons.password_outlined,
            isObscure: true,
            onChange: (value) => loginCubit.passwordChanged(value),
            errorMessage: password.errorMessage,
          ),
          const SizedBox(height: 226),
          FilledButton(
            onPressed:
                loginCubit.state.isValid
                    ? () {
                      loginCubit.onSubmit();
                      print(password.errorMessage);

                      context.push('/dashboard');
                    }
                    : null,
            style: FilledButton.styleFrom(minimumSize: const Size(200, 40)),
            child: const Text('Iniciar sesión'),
          ),
        ],
      ),
    );
  }
}
