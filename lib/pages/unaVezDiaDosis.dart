import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:met_control/pages/mostrarMedicinas.dart';





class PaginaUnaVezAlDia extends StatelessWidget {
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
    UnaVezAlDia(),
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






//una ves al dia






class UnaVezAlDia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String cantidadDosis = "";
    String horaTomado = "";

    return Scaffold(
      appBar: AppBar(
        title: Text('Una Vez al Día'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('¿Cuándo debe tomar la dosis?'),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Tomar:'),
                SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Cantidad de dosis',
                    ),
                    onChanged: (value) {
                      cantidadDosis = value;
                    },
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Acciones al hacer clic en el icono de editar
                    print('Editar cantidad de dosis');
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Hora de tomado:'),
                SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Establecer hora',
                    ),
                    onChanged: (value) {
                      horaTomado = value;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navegar a la segunda página y pasar los valores
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Medicamentos(
                    ),
                  ),
                );
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
