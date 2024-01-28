import 'package:flutter/material.dart';
import 'package:met_control/screens/welcome.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          ElevatedButton(
            onPressed: () {
              // Navegar a la nueva página cuando se presiona el botón
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Bienvenida()), // Reemplaza HomeScreen con el nombre de tu nueva página
              );
            },
            child: Text('Iniciar sesión'),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido a la Página de Inicio'),
      ),
      body: Center(
        child: Text('Contenido de la página de inicio'),
      ),
    );
  }
}

class TextFieldWithIcon extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;

  const TextFieldWithIcon({
    Key? key,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
      ),
    );
  }
}
