import 'package:chronos_mobile/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlarmListScreen extends StatefulWidget {
  const AlarmListScreen({super.key});

  @override
  State<AlarmListScreen> createState() => _AlarmListScreenState();
}

class _AlarmListScreenState extends State<AlarmListScreen> {
  bool _modoSiesta = false;

  final List<Map<String, dynamic>> _alarmas = [
    {
      'titulo': 'Alarma Resolver un acertijo',
      'horario': '00:00',
      'dias': [false, false, false, true, false, false, false],
    },
    {
      'titulo': 'Alarma ejercicio de memoria',
      'horario': '00:00',
      'dias': [false, false, false, true, false, false, false],
    },
    {
      'titulo': 'Alarma Reconocimiento facial',
      'horario': '00:00',
      'dias': [false, false, false, true, false, false, false],
    },
    {
      'titulo': 'Alarma desafío deportivo',
      'horario': '00:00',
      'dias': [false, false, false, true, false, false, false],
    },
    {
      'titulo': 'Alarma desafío deportivo',
      'horario': '00:00',
      'dias': [false, false, false, true, false, false, false],
    },
    {
      'titulo': 'Alarma desafío deportivo',
      'horario': '00:00',
      'dias': [false, false, false, true, false, false, false],
    },
    {
      'titulo': 'Alarma desafío deportivo',
      'horario': '00:00',
      'dias': [false, false, false, true, false, false, false],
    },
    {
      'titulo': 'Alarma desafío deportivo',
      'horario': '00:00',
      'dias': [false, false, false, true, false, false, false],
    },
    {
      'titulo': 'Alarma desafío deportivo',
      'horario': '00:00',
      'dias': [false, false, false, true, false, false, false],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple[50]!, Colors.deepPurple[50]!],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 80,
            ),
            child: Column(
              children: [
                // App Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.deepPurple[800],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(Icons.menu, color: Colors.deepPurple[800]),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Título
                Text(
                  'ALARMAS',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple[800],
                  ),
                ),
                const SizedBox(height: 24),

                // Configuración
                TextButton(
                  onPressed: () {
                    // NAvegación
                  },
                  child: Row(
                    children: [
                      Icon(Icons.settings, color: Colors.deepPurple[800]),
                      const SizedBox(width: 8),
                      Text(
                        'Configura tus alarmas',
                        style: TextStyle(
                          color: Colors.deepPurple[800],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Modo Siesta Switch
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Switch(
                        value: _modoSiesta,
                        onChanged: (value) {
                          setState(() {
                            _modoSiesta = value;
                          });
                        },
                        activeColor: Colors.deepPurple,
                        activeTrackColor: Colors.deepPurple[200],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Activar modo siesta',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Lista de Alarmas
                Expanded(
                  child: ListView.builder(
                    itemCount: _alarmas.length,
                    itemBuilder: (context, index) {
                      return _buildAlarmaCard(_alarmas[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/create-alarm');
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.deepPurple[800],
        child: const Icon(
          Icons.add_circle_outline_outlined,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildAlarmaCard(Map<String, dynamic> alarma) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: alarmListcolor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      alarma['titulo'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      alarma['horario'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _buildDiasSelector(alarma['dias']),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  List<Widget> _buildDiasSelector(List<bool> dias) {
    final List<String> diasAbrev = ['L', 'M', 'M', 'J', 'V', 'S', 'D'];
    List<Widget> widgets = [];

    for (int i = 0; i < diasAbrev.length; i++) {
      widgets.add(
        GestureDetector(
          onTap: () {
            // Actualizar selección del día
          },
          child: Container(
            width: 30,
            height: 30,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: dias[i] ? Colors.deepPurple[800] : Colors.transparent,
            ),
            child: Center(
              child: Text(
                diasAbrev[i],
                style: TextStyle(
                  color: dias[i] ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return widgets;
  }
}
