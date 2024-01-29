import 'package:flutter/material.dart';
import 'package:met_control/screens/welcome.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';




class LoginScreen extends StatelessWidget {
  final GlobalKey<FormBuilderState> loginFormKey;

  LoginScreen({required this.loginFormKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormBuilderTextField(
              name: 'email',
              decoration: InputDecoration(labelText: 'Correo electrónico'),
              validator: FormBuilderValidators.email(context),
            ),
            FormBuilderTextField(
              name: 'password',
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
              validator: FormBuilderValidators.required(context),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                        MaterialPageRoute(builder: (context) => Bienvenida()), // Reemplaza OtraPagina con el nombre de tu nueva página
                  );
              },
              child: Text('Iniciar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}

class FormBuilderValidators {
  static required(BuildContext context) {}
  
  static email(BuildContext context) {}
}