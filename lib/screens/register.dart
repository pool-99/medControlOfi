import 'package:flutter/material.dart';
import 'package:met_control/screens/login.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                RegisterScreen(),
                LoginScreen(),
              ],
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _pageController.animateToPage(0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _currentPage == 0 ? Colors.blue : null,
                ),
                child: Text('Registro'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  _pageController.animateToPage(1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _currentPage == 1 ? Colors.blue : null,
                ),
                child: Text('Iniciar sesión'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldWithIcon(
            icon: Icons.person,
            hintText: 'Nombre',
          ),
          TextFieldWithIcon(
            icon: Icons.phone,
            hintText: 'Número de teléfono',
          ),
          TextFieldWithIcon(
            icon: Icons.email,
            hintText: 'Correo electrónico',
          ),
          TextFieldWithIcon(
            icon: Icons.lock,
            hintText: 'Contraseña',
            isPassword: true,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Lógica para el botón "Regístrate aquí"
                },
                child: Text('Regístrate aquí'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Lógica para el botón "Regístrate con Facebook"
                },
                child: Text('Regístrate con Facebook'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


  