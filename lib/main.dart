import 'package:chronos_mobile/ui/screens/create_alarm_screen.dart';
import 'package:chronos_mobile/ui/screens/study_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:chronos_mobile/ui/screens/login_screen.dart';
import 'package:chronos_mobile/ui/screens/chronos_screen.dart';
import 'package:chronos_mobile/ui/screens/alarm_list_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Chronos App',
      routerConfig: appRouter, // ✅ Usa `routerConfig` en lugar de `routes`
    );
  }
}

// ✅ Configuración correcta de GoRouter
final GoRouter appRouter = GoRouter(
  initialLocation: '/',  // ✅ Inicia en LoginScreen
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const ChronosScreen(),
    ),
    GoRoute(
      path: '/alarm-list',
      builder: (context, state) => const AlarmListScreen(),
    ),
    GoRoute(
      path: '/sesiones',
      builder: (context, state) => const StudySessionsScreen(),
    ),
    GoRoute(
      path: '/create-alarm',
      builder: (context, state) => const CreateAlarmScreen(),
    ),
  ],
);
