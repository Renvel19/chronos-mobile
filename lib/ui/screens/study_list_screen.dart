import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StudySessionsScreen extends StatelessWidget {
  const StudySessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'SESIONES DE ESTUDIO',
          style: TextStyle(
            color: Color(0xFF6A0DAD),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF6A0DAD)),
          onPressed: () => GoRouter.of(context).go('/dashboard'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Color(0xFF6A0DAD)),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF6A0DAD)),
              child: Text(
                'Menú',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.alarm, color: Color(0xFF6A0DAD)),
              title: const Text('Alarmas'),
              onTap: () => GoRouter.of(context).go('/alarmas'),
            ),
            ListTile(
              leading: const Icon(Icons.school, color: Color(0xFF6A0DAD)),
              title: const Text('Estudio'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.notifications, color: Color(0xFF6A0DAD)),
              title: const Text('Recordatorio'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sesión 1',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Inicio 00:00'),
                  Text('Fin 00:00'),
                  Text('Materia: Lorem'),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: () {
          },
          shape: const CircleBorder(),
          backgroundColor: const Color(0xFF6A0DAD),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
