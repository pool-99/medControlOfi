import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:met_control/pages/agregarMedicina.dart';
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

  // Lista de páginas correspondientes a cada ícono del ConvexAppBar
  final List<Widget> _pages = [
    HoyPage(),
    PlaceholderWidget('Mi Historia Page'),
    MedicamentosPage(),
    ConsejosPage(),
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
  final List<String> imageConsejos = [
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

  final List<String> descriptions = [
    'Come alimentos saludables para mantener un estilo de vida equilibrado.',
    'La vacunación es crucial para prevenir enfermedades y proteger a la comunidad.',
    'Evita el consumo de alcohol para cuidar tu salud.',
    'Deja de fumar para mejorar tu salud pulmonar y cardiovascular.',
    'Realiza caminatas diarias para mantener un cuerpo activo y saludable.',
    'Cuida a los más pequeños y asegúrate de satisfacer sus necesidades.',
    'Realiza chequeos médicos periódicos para detectar posibles problemas de salud.',
    'Adopta hábitos que promuevan un cuerpo sano y fuerte.',
    'Gestiona el estrés de manera efectiva para mejorar tu bienestar emocional.',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: imageConsejos.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            // Mostrar el widget de detalle cuando se toque una imagen
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return DetalleConsejo(
                  imageConsejo: imageConsejos[index],
                  title: titles[index],
                  description: descriptions[index],
                  onClose: () {
                    Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
                  },
                );
              },
            );
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
                  imageConsejos[index],
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

class DetalleConsejo extends StatelessWidget {
  final String imageConsejo;
  final String title;
  final VoidCallback onClose;
  final String description;


  DetalleConsejo({required this.imageConsejo, required this.title, required this.description, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          Image.network(
            imageConsejo,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          SizedBox(height: 30.0),
          ElevatedButton(
            onPressed: onClose,
            child: Text('Volver a Consejos'),
          ),
        ],
      ),
    );
  }
}
