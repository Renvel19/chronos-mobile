import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:go_router/go_router.dart';

class ChronosScreen extends StatefulWidget {
  const ChronosScreen({super.key});

  @override
  _ChronosScreenState createState() => _ChronosScreenState();
}

class _ChronosScreenState extends State<ChronosScreen> {
  late TimeOfDay _selectedTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        final now = DateTime.now();
        _selectedTime = TimeOfDay(hour: now.hour, minute: now.minute);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'CHRONOS',
          style: TextStyle(
            color: Color(0xFF6A0DAD),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Color(0xFF6A0DAD)),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF6A0DAD),
              ),
              child: const Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.alarm, color: Color(0xFF6A0DAD)),
              title: const Text('Alarmas'),
              onTap: () {
                GoRouter.of(context).go('/alarm-list');
              },
            ),
            ListTile(
              leading: const Icon(Icons.school, color: Color(0xFF6A0DAD)),
              title: const Text('Estudio'),
              onTap: () {
                GoRouter.of(context).go('/sesiones');
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications, color: Color(0xFF6A0DAD)),
              title: const Text('Recordatorio'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: CustomPaint(
                painter: ClockPainter(_selectedTime),
              ),
            ),
            const SizedBox(height: 40),
            _buildOptionButton('ALARMAS', '/alarm-list'),
            _buildOptionButton('ESTUDIO', '/sesiones'),
            _buildOptionButton('RECORDATORIO'),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(String text, [String? route]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: const BoxDecoration(
              color: Color(0xFF6A0DAD),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6A0DAD),
              ),
              onPressed: () {
                if (route != null) {
                  GoRouter.of(context).go(route);
                }
              },
              child: Text(text, style: const TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final TimeOfDay time;

  ClockPainter(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final paintCircle = Paint()
      ..color = Colors.purple[50]!
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, paintCircle);

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    
    for (int i = 1; i <= 24; i++) {
      final angle = ((i - 1) * (2 * pi / 24)) - pi / 2;
      final offsetRadius = radius * 0.85;
      final offset = Offset(
        center.dx + offsetRadius * cos(angle),
        center.dy + offsetRadius * sin(angle),
      );
      
      textPainter.text = TextSpan(
        text: i.toString(),
        style: const TextStyle(color: Colors.black, fontSize: 14),
      );
      textPainter.layout();
      textPainter.paint(canvas, offset - Offset(textPainter.width / 2, textPainter.height / 2));
    }

    final paintHand = Paint()
      ..color = Colors.purple[400]!
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    double hourAngle = ((time.hour % 24) + (time.minute / 60)) * (2 * pi / 24) - pi / 2;
    final handLength = radius * 0.75;
    final handEnd = Offset(
      center.dx + handLength * cos(hourAngle),
      center.dy + handLength * sin(hourAngle),
    );

    canvas.drawLine(center, handEnd, paintHand);

    final paintHourCircle = Paint()
      ..color = Colors.purple[400]!
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(handEnd, radius * 0.1, paintHourCircle);

    final paintDot = Paint()
      ..color = Colors.purple[400]!
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, 8, paintDot);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
