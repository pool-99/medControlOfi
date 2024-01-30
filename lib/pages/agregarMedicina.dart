import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';





class OtraPagina extends StatelessWidget {
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
    OtraPaginaa(),
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



class NuevaPagina extends StatelessWidget {
  final String nombreMedicamento;
  final String cantidadDosis;

  NuevaPagina({
    required this.nombreMedicamento,
    required this.cantidadDosis,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Establecer el color de fondo verde
        title: Text('Medicinas Agregadas'), // Cambiar el título
        leading: IconButton(
          icon: Icon(Icons.person), // Agregar el icono de usuario
          onPressed: () {
            // Acciones al hacer clic en el icono de usuario
            print('Icono de usuario presionado');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Nombre de la medicina: $nombreMedicamento'),
            SizedBox(height: 16),
            Text('Cantidad de dosis: $cantidadDosis'),
          ],
        ),
      ),
    );
  }
}





class OtraPaginaa extends StatefulWidget {
  @override
  _OtraPaginaaState createState() => _OtraPaginaaState();
}

class _OtraPaginaaState extends State<OtraPaginaa> {
  String _presentacionSeleccionada = 'Pastilla';
  TextEditingController _nombreMedicamentoController = TextEditingController();
  TextEditingController _cantidadDosisController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fecha: ${DateTime.now().toString()}'),
            SizedBox(height: 16),
            Text('Agregar foto de medicamento'),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Acciones al hacer clic en el botón de agregar foto
                      print('Botón de agregar foto presionado');
                    },
                    icon: Icon(Icons.add_a_photo),
                    label: Text('Agregar Foto'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _nombreMedicamentoController,
              decoration: InputDecoration(labelText: 'Nombre de Medicamento'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _cantidadDosisController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Cantidad de Dosis'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _presentacionSeleccionada.isNotEmpty
                  ? () {
                      // Acciones al hacer clic en el botón "Continuar"
                      print('Botón Continuar presionado');

                      // Obtener el nombre y cantidad de dosis desde los controladores
                      String nombreMedicamento = _nombreMedicamentoController.text;
                      String cantidadDosis = _cantidadDosisController.text;

                      // Navegar a otra página y pasar la información
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NuevaPagina(
                            nombreMedicamento: nombreMedicamento,
                            cantidadDosis: cantidadDosis,
                          ),
                        ),
                      );
                    }
                  : null,
              child: Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
