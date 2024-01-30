import 'package:flutter/material.dart';
import 'package:met_control/screens/register.dart';

class Terminos extends StatefulWidget {
  @override
  _TerminosPageState createState() => _TerminosPageState();
}

class _TerminosPageState extends State<Terminos> {
  bool aceptarTermino1 = false;
  bool aceptarTermino2 = false;

  bool get canAceptar => aceptarTermino1 && aceptarTermino2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        
        children: [
          Text(
            'Términos y Condiciones',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              
            ),
          ),
          SizedBox(height: 16.0),
          TerminosCheckbox(
            texto: 'Acepto la Política de privacidad y las Condiciones de uso',
            value: aceptarTermino1,
              onChanged: (value) {
                setState(() {
                aceptarTermino1 = value!;
              });
            },
  textColor: Colors.blue, // Establecer el color del texto a azul
),

          SizedBox(height: 8.0),
          TerminosCheckbox(
            texto:
                'Al emplear nuestra app de alarmas medicamentosas, asumes plena responsabilidad por la gestión y precisión de la información proporcionada. La app se ha desarrollado con el propósito de ofrecer recordatorios personalizados para la toma de medicamentos, y tu privacidad es primordial; la información será tratada conforme a nuestra Política de Privacidad. Se espera que utilices la app de manera ética y responsable, siendo el usuario responsable de cualquier consecuencia derivada de un uso inadecuado. Las actualizaciones regulares mejorarán la funcionalidad y seguridad de la app. Al utilizar la aplicación, comprendes y aceptas que la empresa no asume responsabilidad por posibles daños resultantes de su uso. Agradecemos tu confianza en nuestra app de alarmas medicamentosas.',
            value: aceptarTermino2,
            onChanged: (value) {
              setState(() {
                aceptarTermino2 = value!;
              });
            },
          ),
          // Añadir más términos y condiciones según sea necesario
          SizedBox(height: 16.0),
          ElevatedButton(
  onPressed: canAceptar
      ? () {
          // Navegar a otra página o realizar acciones después de aceptar los términos
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AuthScreen(),
            ),
          );
        }
      : null,
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue, // Establecer el color del botón a azul
    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: -15.0), // Ajustar el tamaño del botón
  ),
  child: Text(
    'Aceptar',
    style: TextStyle(
      color: Colors.white, // Establecer el color del texto a blanco
      fontSize: 12.0, // Ajustar el tamaño del texto
    ),
  ),
),

        ],
      ),
    );
  }
}

class TerminosCheckbox extends StatelessWidget {
  final String texto;
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Color textColor; // Nuevo atributo para el color del texto

  const TerminosCheckbox({
    required this.texto,
    required this.value,
    required this.onChanged,
    this.textColor = Colors.black, // Valor predeterminado: negro
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Flexible(
          child: Text(
            texto,
            style: TextStyle(
              fontSize: 16.0,
              color: textColor, // Aplicar el color del texto aquí
            ),
          ),
        ),
      ],
    );
  }
}