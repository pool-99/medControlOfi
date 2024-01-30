import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

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
  late String _appBarTitle;

  final List<String> _appBarTitles = ['Hoy', 'Mi Historia', 'Medicamentos', 'Consejos'];


  // Lista de páginas correspondientes a cada ícono del ConvexAppBar
  final List<Widget> _pages = [
    //PlaceholderWidget('Hoy Page'),
    HoyPage(),
    PlaceholderWidget('Mi Historia Page'),
    MedicamentosPage(),
    ConsejosPage(),
  ];

  @override
  void initState() {
    super.initState();
    _appBarTitle = _appBarTitles[_currentIndex];
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xD193C3B8),
        title: Text(_appBarTitle),
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            print('Icono de usuario presionado');
          },
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Color(0xD193C3B8),
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
            _appBarTitle = _appBarTitles[_currentIndex];

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
              backgroundColor: Color(0xD193C3B8), // Color del botón
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

class HoyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Contenido de la página de Hoy

          // Primer Contenedor Reloj
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // Cambia la posición de la sombra
                ),
              ],
            ),
              child: CircularStepProgressIndicator(
                totalSteps: 100,
                currentStep: 74,
                stepSize: 10,
                selectedColor: Colors.greenAccent,
                unselectedColor: Colors.grey[200],
                padding: 0,
                width: 150,
                height: 150,
                selectedStepSize: 15,
                roundedCap: (_, __) => true,
              ),
          )
        ],
      ),
    );
  }
}

class ConsejosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: MyGrid(),
      ),
    );
  }
}

class MyGrid extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/img/Consejo01.png',
    'assets/img/Consejo02.png',
    'assets/img/Consejo03.png',
    'assets/img/Consejo04.png',
    'assets/img/Consejo05.png',
    'assets/img/Consejo06.png',
    'assets/img/Consejo07.png',
    'assets/img/Consejo08.png',
    'assets/img/Consejo09.png',
  ];

  final List<String> titles = [
    'Comer Saludable',
    'Importancia de vacunarse',
    'No Alcohol',
    'No Fumar',
    'Camina',
    'Bebes',
    'Chequeos',
    'Cuerpo Sano',
    'Estres',
  ];

  final List<String> urls = [
    'URL_1',
    'URL_2',
    'URL_3',
    'URL_4',
    'URL_5',
    'URL_6',
    'URL_7',
    'URL_8',
    'URL_9',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: imageUrls.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            // Aquí puedes manejar la navegación a la URL correspondiente
            print('Tocaste la parcela ${index + 1}: ${urls[index]}');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Color.fromARGB(255, 164, 197, 207),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                ClipOval(
                child: Image.network(
                  imageUrls[index],
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  
                ),
                ),
                SizedBox(height: 8.0),
                Text(
                  titles[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}