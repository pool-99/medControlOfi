import 'package:flutter/material.dart';
import 'package:met_control/screens/home.dart';

class Presentacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/presentacion.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: -42,
              top: -6,
              child: Container(
                width: MediaQuery.of(context).size.width + 42,
                height: MediaQuery.of(context).size.height + 6,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.29),
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: MediaQuery.of(context).size.height * 0.667,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                height: MediaQuery.of(context).size.height * 0.219,
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
              left: MediaQuery.of(context).size.width * 0.235,
              top: MediaQuery.of(context).size.height * 0.872,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Medicamentos()), // Reemplaza OtraPagina con el nombre de tu nueva página
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.472,
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
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Siguiente',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.056,
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
