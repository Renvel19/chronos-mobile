import 'package:chronos_mobile/ui/bloc/cubit/create_alarm/create_alarm_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAlarmForm extends StatefulWidget {
  const CreateAlarmForm({
    required this.nombreController,
    required this.minutosController,
    required this.horaController,
    required this.segundosController,
    super.key,
  });

  final TextEditingController nombreController;
  final TextEditingController horaController;
  final TextEditingController segundosController;
  final TextEditingController minutosController;

  @override
  State<CreateAlarmForm> createState() => _CreateAlarmFormState();
}

class _CreateAlarmFormState extends State<CreateAlarmForm> {
  @override
  Widget build(BuildContext context) {
    String _sonidoSeleccionado = 'Melodía 1';
    bool _sonidoProgresivo = false;
    bool _activarUbicacion = false;

    // Horas y minutos iniciales
    final createAlarmCubit = context.watch<CreateAlarmCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Barra superior
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.deepPurple[700]),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.menu, color: Colors.deepPurple[700]),
              onPressed: () {
                // Acción del menú
              },
            ),
          ],
        ),

        // Título
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'ALARMAS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[800],
              ),
            ),
          ),
        ),

        // Etiqueta "Hora"
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 8.0),
          child: Text(
            'Hora',
            style: TextStyle(fontSize: 16, color: Colors.deepPurple[700]),
          ),
        ),

        // Selector de Hora
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Horas
            Container(
              width: 80,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: TextField(
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: widget.horaController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '00',
                    hintStyle: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),

                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    errorText: createAlarmCubit.state.hora.errorMessage,
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        widget.horaController.text = "00";
                      });
                    } else if (value.length > 2) {
                      setState(() {
                        widget.horaController.text = value.substring(0, 2);
                      });
                    }
                    if (widget.minutosController.text.isEmpty) {
                      widget.minutosController.text = "00";
                    }
                    if (widget.segundosController.text.isEmpty) {
                      widget.segundosController.text = "00";
                    }

                    createAlarmCubit.horaChanged(
                      int.parse(widget.horaController.text),
                      int.parse(widget.minutosController.text),
                      int.parse(widget.segundosController.text),
                    );
                  },
                ),
              ),
            ),

            // Separador
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                ':',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ),

            // Minutos
            Container(
              width: 80,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: widget.minutosController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '00',
                    hintStyle: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),

                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    if (widget.minutosController.text.isEmpty) {
                      widget.minutosController.text = "00";
                    }
                    if (value.length > 2) {
                      setState(() {
                        widget.minutosController.text = value.substring(0, 2);
                      });
                    }

                    print(widget.segundosController.text);
                    createAlarmCubit.minutosChanged(
                      int.parse(widget.minutosController.text),
                    );
                  },
                ),
              ),
            ),

            // Contenedor de segundos
            Container(
              width: 80,
              height: 60,
              margin: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: widget.segundosController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '00',
                    hintStyle: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),

                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    if (widget.segundosController.text.isEmpty) {
                      widget.segundosController.text = "00";
                    }
                    if (value.length > 2) {
                      setState(() {
                        widget.segundosController.text = value.substring(0, 2);
                      });
                    }

                    createAlarmCubit.segundosChanged(
                      int.parse(widget.segundosController.text),
                    );
                  },
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Campo de Nombre
        TextField(
          controller: widget.nombreController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Nombre',
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            errorText: createAlarmCubit.state.nombre.errorMessage,
          ),
          onChanged: (value) => createAlarmCubit.nombreChanged(value),
        ),

        const SizedBox(height: 16),

        // Selector de Sonido
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: _sonidoSeleccionado,
              hint: const Text('Sonido'),
              icon: const Icon(Icons.keyboard_arrow_down),
              items:
                  ['Melodía 1', 'Melodía 2', 'Vibración', 'Silencio'].map((
                    String value,
                  ) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _sonidoSeleccionado = newValue;
                  });
                }
              },
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Checkbox de Sonido Progresivo
        Row(
          children: [
            Checkbox(
              value: _sonidoProgresivo,
              activeColor: Colors.deepPurple[700],
              onChanged: (bool? value) {
                if (value != null) {
                  setState(() {
                    _sonidoProgresivo = value;
                  });
                }
              },
            ),
            const Text('Sonido progresivo'),
          ],
        ),

        // Radio button para Activar ubicación
        Row(
          children: [
            Radio(
              value: true,
              groupValue: _activarUbicacion,
              activeColor: Colors.deepPurple[700],
              onChanged: (bool? value) {
                if (value != null) {
                  setState(() {
                    _activarUbicacion = value;
                  });
                }
              },
            ),
            const Text('Activar ubicación'),
          ],
        ),

        const Spacer(),

        // Botón de Guardar
        Center(
          child: Container(
            width: 200,
            height: 50,
            margin: const EdgeInsets.only(bottom: 16),
            child: FilledButton(
              onPressed:
                  createAlarmCubit.state.isValid
                      ? () {
                        createAlarmCubit.onSubmit();
                        Navigator.pop(context);
                      }
                      : null,
              style: ElevatedButton.styleFrom(
                disabledBackgroundColor: Colors.grey[400],
                disabledForegroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),

              child: const Text('Guardar', style: TextStyle(fontSize: 16)),
            ),
          ),
        ),
      ],
    );
  }
}
