import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'dart:async';
import 'package:met_control/pages/unaVezDiaDosis.dart';


class cadaDia extends StatelessWidget {
  final String nombreMedicamento;

  cadaDia({required this.nombreMedicamento});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Medicamentos(nombreMedicamento: nombreMedicamento),
    );
  }
}

class Medicamentos extends StatefulWidget {
  final String nombreMedicamento;

  Medicamentos({required this.nombreMedicamento});

  @override
  _MedicamentosState createState() => _MedicamentosState();
}

class _MedicamentosState extends State<Medicamentos> {
  int _currentIndex = 2; // Índice inicial para "Medicamentos"

  // Lista de páginas correspondientes a cada ícono del ConvexAppBar
  final List<Widget> _pages = [
    PlaceholderWidget('Hoy Page'),
    PlaceholderWidget('Mi Historia Page'),
    PaginaCadaDia(),
    PlaceholderWidget('Consejos Page'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(209, 32, 197, 120),
        title: Text('Medicamentos: ${widget.nombreMedicamento}'),
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





class PaginaCadaDia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('¿Con qué frecuencia se lo administrará?'),
            SizedBox(height: 16),
            Container(
              height: 150,
              child: ListView(
                children: <String>[
                  'Una vez al día',
                  'Dos veces al día',
                  'Tres veces al día'
                ].map<Widget>((String value) {
                  return ListTile(
                    title: Text(value),
                    onTap: () {
                      // Navegar a una página diferente según la opción seleccionada
                      switch (value) {
                        case 'Una vez al día':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaginaUnaVezAlDia(),
                            ),
                          );
                          break;
                        case 'Dos veces al día':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaginaDosVecesAlDia(),
                            ),
                          );
                          break;
                        case 'Tres veces al día':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaginaTresVecesAlDia(),
                            ),
                          );
                          break;
                        default:
                          break;
                      }
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}











//dos veces al dia
class PaginaDosVecesAlDia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dos Veces al Día'),
      ),
      body: Center(
        child: Text('Contenido para "Dos Veces al Día"'),
      ),
    );
  }
}





//tres veces al dia
class PaginaTresVecesAlDia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tres Veces al Día'),
      ),
      body: Center(
        child: Text('Contenido para "Tres Veces al Día"'),
      ),
    );
  }
}
