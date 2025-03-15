import 'package:chronos_mobile/ui/bloc/cubit/create_alarm/create_alarm_cubit.dart';
import 'package:chronos_mobile/ui/widgets/form/create_alarm_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAlarmScreen extends StatefulWidget {
  const CreateAlarmScreen({super.key});

  @override
  State<CreateAlarmScreen> createState() => _CreateAlarmState();
}

class _CreateAlarmState extends State<CreateAlarmScreen> {
  // Controladores y variables
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _horaController = TextEditingController();
  final TextEditingController _segundosController = TextEditingController();
  final TextEditingController _minutosController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _horaController.dispose();
    _segundosController.dispose();
    _minutosController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateAlarmCubit(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.deepPurple[50]),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CreateAlarmForm(
                nombreController: _nombreController,
                horaController: _horaController,
                segundosController: _segundosController,
                minutosController: _minutosController,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
