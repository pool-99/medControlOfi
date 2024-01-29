import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

void main() {
  runApp(MedicamentosApp());
}

class MedicamentosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Medicamentos(),
    );
  }
}

class Medicamentos extends StatefulWidget {
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
        title: Text('Medicamentos'),
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            print('Icono de usuario presionado');
          },
        ),
      ),
      body: _pages[_currentIndex],
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

class MedicamentosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
            ),
          ),
        ],
      ),
    );
  }
}

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
