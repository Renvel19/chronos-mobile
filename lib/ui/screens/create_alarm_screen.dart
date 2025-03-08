import 'package:flutter/material.dart';

class CreateAlarmScreen extends StatefulWidget {
  const CreateAlarmScreen({Key? key}) : super(key: key);

  @override
  State<CreateAlarmScreen> createState() => _CreateAlarmState();
}

class _CreateAlarmState extends State<CreateAlarmScreen> {
  // Controladores y variables
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _horaController = TextEditingController();
  final TextEditingController _segundosController = TextEditingController();
  final TextEditingController _minutosController = TextEditingController();
  String _sonidoSeleccionado = 'Melodía 1';
  bool _sonidoProgresivo = false;
  bool _activarUbicacion = false;

  // Horas y minutos iniciales
  int _horas = 0;
  int _minutos = 0;
  int _segundos = 0;

  @override
  void dispose() {
    _nombreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.deepPurple[50]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Barra superior
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.deepPurple[700],
                      ),
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
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    top: 16.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    'Hora',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.deepPurple[700],
                    ),
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
                          controller: _horaController,
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
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                          controller: _minutosController,
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
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                          controller: _segundosController,
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
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Campo de Nombre
                TextField(
                  controller: _nombreController,
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
                  ),
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
                          [
                            'Melodía 1',
                            'Melodía 2',
                            'Vibración',
                            'Silencio',
                          ].map((String value) {
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor: Colors.grey[400],
                        disabledForegroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),

                      child: const Text(
                        'Guardar',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
