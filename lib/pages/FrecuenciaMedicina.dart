import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:met_control/pages/cadaDia.dart';


class NuevaPagina extends StatelessWidget {


  final String nombreMedicamento;

   NuevaPagina({required this.nombreMedicamento});
  
  
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
    Frecuencia(),
    PlaceholderWidget('Consejos Page'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(209, 72, 238, 160),
         title: Text('Medicamentos: ${widget.nombreMedicamento}'),
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            print('Icono de usuario presionado');
          },
        ),
      ),
      body: 
      
    
      _pages[_currentIndex],
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











class Frecuencia extends StatelessWidget {
  

  


 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text('¿Con qué frecuencia se lo administrará?: '),
            SizedBox(height: 16),
            Container(
              height: 150,
              child: ListView(
                children: <String>[
                  'Cada día',
                  'Día por medio',
                  'Días específicos a la semana'
                ].map<Widget>((String value) {
                  return ListTile(
                    title: Text(value),
                    onTap: () {
                      // Navegar a otra página al seleccionar cualquier opción
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtraPagina(opcionSeleccionada: value),
                        ),
                      );
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

class OtraPagina extends StatelessWidget {
  final String opcionSeleccionada;

  OtraPagina({required this.opcionSeleccionada});
  
  

  @override
  Widget build(BuildContext context) {
    String contenidoDiferente = '';

    // Determinar el contenido diferente según la opción seleccionada
    switch (opcionSeleccionada) {
      case 'Cada día':
        contenidoDiferente = 'Texto para la opción "Cada día"';
        return cadaDia(nombreMedicamento: '',);
      case 'Día por medio':
        contenidoDiferente = 'Texto para la opción "Día por medio"';
        break;
      case 'Días específicos a la semana':
        contenidoDiferente = 'Texto para la opción "Días específicos a la semana"';
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Otra Página'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Seleccionaste: $opcionSeleccionada'),
            SizedBox(height: 16),
            Text(contenidoDiferente),
          ],
        ),
      ),
    );
  }
}






