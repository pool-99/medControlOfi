import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'dart:async';

void main() {
  runApp(const MedicamentosApp());
}

class MedicamentosApp extends StatelessWidget {
  const MedicamentosApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Medicamentos(),
    );
  }
}

class Medicamentos extends StatefulWidget {
  const Medicamentos({Key? key});

  @override
  _MedicamentosState createState() => _MedicamentosState();
}

class _MedicamentosState extends State<Medicamentos> {
  int _currentIndex = 2; // Índice inicial para "Medicamentos"

  // Lista de páginas correspondientes a cada ícono del ConvexAppBar
  final List<Widget> _pages = [
    PlaceholderWidget('Hoy Page'),
    PlaceholderWidget('Mi Historia Page'),
    MedicamentosPage(),
    PlaceholderWidget('Consejos Page'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(209, 32, 197, 120),
        title: const Text('Medicamentos'),
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            print('Icono de usuario presionado');
          },
        ),
      ),
      body: _currentIndex == 0 ? HoyPage() : _pages[_currentIndex],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Color.fromARGB(209, 32, 197, 120),
        items: [
          TabItem(icon: Icons.calendar_today, title: 'Hoy'),
          TabItem(icon: Icons.show_chart, title: 'Mi Historia'),
          TabItem(icon: Icons.local_hospital, title: 'Medicamentos'),
          TabItem(icon: Icons.lightbulb_outline, title: 'Consejos'),
        ],
        initialActiveIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final String text;

  PlaceholderWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}

<<<<<<< HEAD
class MedicamentosPage extends StatelessWidget {
=======
class HoyPage extends StatefulWidget {
  @override
  _HoyPageState createState() => _HoyPageState();
}

class _HoyPageState extends State<HoyPage> {
  late Timer _timer;
  int _duration = 24 * 60 * 60; // Duración de 24 horas en segundos

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_duration > 0) {
          _duration--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  String _formatDuration(int seconds) {
    Duration duration = Duration(seconds: seconds);
    return '${duration.inHours}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

>>>>>>> 6c20ca5e6e8e033d2a694b602562e41b8006c9bc
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
<<<<<<< HEAD
          // Contenido de la página de Medicamentos
          Text('Contenido de Medicamentos'),

          // Botón de agregar
          ElevatedButton.icon(
            onPressed: () {
              // Navegar a otra página al presionar el botón
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OtraPagina(),
                ),
              );
            },
            icon: Icon(Icons.add),
            label: Text('Agregar medicamentos'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(209, 32, 197, 120), // Color del botón
=======
          Text('Tiempo Restante'),
          Text(
            _formatDuration(_duration),
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
>>>>>>> 6c20ca5e6e8e033d2a694b602562e41b8006c9bc
            ),
          ),
        ],
      ),
    );
  }
}
<<<<<<< HEAD

class OtraPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Otra Página'),
      ),
      body: Center(
        child: Text('Contenido de Otra Página'),
      ),
    );
  }
}
=======
>>>>>>> 6c20ca5e6e8e033d2a694b602562e41b8006c9bc
