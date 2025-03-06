import 'package:chronos_mobile/ui/bloc/cubit/login/login_cubit.dart';
import 'package:chronos_mobile/ui/widgets/form/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormCubit(),
      child: Scaffold(body: const _LoginView()),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(children: [FlutterLogo(size: 300), LoginForm()]),
        ),
      ),
    );
  }
}
