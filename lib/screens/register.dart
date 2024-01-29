import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:met_control/screens/login.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  final GlobalKey<FormBuilderState> _registerFormKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> _loginFormKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _currentPage == 0
                ? Text('Bienvenido, regístrese', style: TextStyle(fontSize: 20))
                : Text('Bienvenido, Iniciar sesión', style: TextStyle(fontSize: 20)),
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
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                RegisterScreen(registerFormKey: _registerFormKey),
                LoginScreen(loginFormKey: _loginFormKey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  final GlobalKey<FormBuilderState> registerFormKey;

  RegisterScreen({required this.registerFormKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: registerFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormBuilderTextField(
              name: 'name',
              decoration: InputDecoration(labelText: 'Nombre'),
              validator: FormBuilderValidators.required(context),
            ),
            FormBuilderTextField(
              name: 'phone',
              decoration: InputDecoration(labelText: 'Número de teléfono'),
              validator: FormBuilderValidators.required(context),
            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (registerFormKey.currentState!.saveAndValidate()) {
                      // Lógica para el botón "Regístrate aquí"
                      showToast('Registrarse aquí');
                    }
                  },
                  child: Text('Regístrate aquí'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el botón "Regístrate con Facebook"
                    showToast('Registrarse con Facebookk');
                  },
                  child: Text('Regístrate con Facebook'),
                ),
              ],
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



void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.black,
    textColor: Colors.white,
  );
}
