import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Medicamentos extends StatefulWidget {
  @override
  _MedicamentosState createState() => _MedicamentosState();
}

class _MedicamentosState extends State<Medicamentos> {
  int _currentIndex = 2; // Índice inicial para "Medicamentos"

  // Widgets específicos para cada página
  final Widget hoyPage = HoyPage();
  final Widget miHistoriaPage = MiHistoriaPage();
  final Widget mostrarInformacionPage = MostrarInformacionPage(
    cantidadDosis: '5',
    horaTomado: '10:00 AM',
    nombreMedicina: 'Aspirina',
  );
  final Widget consejosPage = ConsejosPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 2 ? buildAppBar() : null,
      body: buildPageContent(),
      bottomNavigationBar: _currentIndex == 2 ? buildBottomNavigationBar() : null,
    );
  }

  // Función para construir el AppBar
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(209, 32, 197, 120),
      title: Text('Medicamentos'),
      leading: IconButton(
        icon: Icon(Icons.person),
        onPressed: () {
          print('Icono de usuario presionado');
        },
      ),
    );
  }

  // Función para construir el contenido de la página
  Widget buildPageContent() {
    switch (_currentIndex) {
      case 0:
        return hoyPage; // Hoy
      case 1:
        return miHistoriaPage; // Mi Historia
      case 2:
        return mostrarInformacionPage; // Medicamentos
      case 3:
        return consejosPage; // Consejos
      default:
        return PlaceholderWidget('Página no implementada');
    }
  }

  // Función para construir el bottomNavigationBar
  ConvexAppBar buildBottomNavigationBar() {
    return ConvexAppBar(
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

class HoyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Contenido de la página Hoy'),
    );
  }
}

class MiHistoriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Contenido de la página Mi Historia'),
    );
  }
}

class ConsejosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Contenido de la página Consejos'),
    );
  }
}

class MostrarInformacionPage extends StatelessWidget {
  final String cantidadDosis;
  final String horaTomado;
  final String nombreMedicina;

  MostrarInformacionPage({
    required this.cantidadDosis,
    required this.horaTomado,
    required this.nombreMedicina,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(209, 32, 197, 120),
        title: Text('Información Guardada'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Nombre de la medicina: $nombreMedicina'),
            SizedBox(height: 16),
            Text('Cantidad de dosis: $cantidadDosis'),
            SizedBox(height: 16),
            Text('Hora de tomado: $horaTomado'),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Color.fromARGB(209, 32, 197, 120),
        items: [
          TabItem(icon: Icons.calendar_today, title: 'Hoy'),
          TabItem(icon: Icons.show_chart, title: 'Mi Historia'),
          TabItem(icon: Icons.local_hospital, title: 'Medicamentos'),
          TabItem(icon: Icons.lightbulb_outline, title: 'Consejos'),
        ],
        initialActiveIndex: 2, // Establecer el índice de Medicamentos activo
        onTap: (int index) {
          // Implementa la lógica de cambio de página aquí si es necesario
        },
      ),
    );
  }
}
