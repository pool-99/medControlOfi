import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:met_control/screens/welcome.dart';
import 'package:met_control/screens/terminos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // Cambiado a SplashScreen como pantalla de inicio
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Iniciar temporizador de 3 segundos
    Timer(
      Duration(seconds: 10),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Terminos()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(223, 41, 230, 236),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Imagen en el centro
              Image.asset(
                'assets/img/inicio.png',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
              // Frase 1: MedControl
              Text(
                'MedControl',
                style: GoogleFonts.rampartOne(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w200,
                  height: 0.03,
                ),
              ),
              // Frase 2: MedControl
              Text(
                'MedControl',
                style: GoogleFonts.modak(
                  color: Colors.white,
                  fontSize: 55,
                  fontWeight: FontWeight.w200,
                  height: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
