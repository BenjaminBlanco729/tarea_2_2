import 'package:flutter/material.dart';
import 'home_page.dart';
import 'input_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _handleLogin() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email == "benjamin.blanco@unah.hn" && password == "20172030154") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Homepage(),
        ),
      );
    } else {
      _showSnackBar('Correo o contraseña incorrecta, pruebe de nuevo.');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage('assets/Ingenieria-en-Sistemas-Logo.png'),
              width: 200,
            ),
            const SizedBox(height: 40),
            InputForm(
              label: 'Correo Institucional',
              icon: Icons.email,
              type: TextInputType.emailAddress,
              controller: emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Ingrese su correo institucional';
                }

                return null;
              },
            ),
            const SizedBox(height: 40),
            InputForm(
              label: 'Contraseña',
              icon: Icons.lock,
              obscureText: true,
              mostrarBoton: true,
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa tu contraseña';
                }
                return null;
              },
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _handleLogin,
              child: const Text('Iniciar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}