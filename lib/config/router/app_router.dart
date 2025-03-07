import 'package:chronos_mobile/ui/screens/alarm_list_screen.dart';
import 'package:chronos_mobile/ui/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/alarm-list',
      builder: (context, state) => const AlarmListScreen(),
    ),
  ],
);
