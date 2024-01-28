import 'package:flutter/material.dart';
import 'package:met_control/screens/presentacion.dart';

class Bienvenida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/bienvenida.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: -36,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height + 72,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 84,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                height: 300,
                child: Text(
                  'MedControl apoya a tu salud',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: 'Josefin Sans',
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 40,
              top: 24,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 80,
                height: 60,
                child: Text(
                  'Tu salud, nuestra misión. Inicia tu día con nosotros.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFD4DBFF),
                    fontSize: 20,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: MediaQuery.of(context).size.height * 0.67,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Text(
                  '¡Descubre cómo estas señales nos orientan hacia un estilo de vida más saludable!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFE5EFFF),
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.15,
              top: MediaQuery.of(context).size.height * 0.88,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                        MaterialPageRoute(builder: (context) => Presentacion()), // Reemplaza OtraPagina con el nombre de tu nueva página
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFF0400F8),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x66000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Siguiente',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
