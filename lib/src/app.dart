import 'package:asm_help1/src/register.dart';
import 'package:asm_help1/src/widget/load.dart';
import 'package:asm_help1/utils/auth_user_util.dart';
import 'package:asm_help1/utils/auth_user_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:asm_help1/src/secondApp.dart';

class MyAppForm extends StatefulWidget {
  const MyAppForm({Key? key}) : super(key: key);
  static String routeName = 'login';

  @override
  State<MyAppForm> createState() => _MyAppFormState();
}

class _MyAppFormState extends State<MyAppForm> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 240.0),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 120.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                        'assets/WhatsApp-Image-2023-10-18-at-15.24.37-removebg-preview-removebg-preview.png'),
                  ),
                  const Text(
                    'Inicio Sesión',
                    style: TextStyle(fontFamily: 'TT Norms', fontSize: 30),
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: username,
                    enableInteractiveSelection: false,
                    decoration: const InputDecoration(
                        hintText: 'Correo',
                        labelText: 'Correo',
                        suffixIcon: Icon(Icons.portrait_outlined)),
                  ),
                  TextField(
                    controller: password,
                    obscureText: true,
                    enableInteractiveSelection: false,
                    decoration: const InputDecoration(
                        hintText: 'Contraseña',
                        labelText: 'Contraseña',
                        suffixIcon: Icon(Icons.password)),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      AuthUserUtil usuario = AuthUserUtil(
                          correo: username.text.trim(),
                          password: password.text.trim());
                      usuario.auth(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary:
                          Colors.black, // Cambiar el color de fondo del botón
                      onPrimary:
                          Colors.white, // Cambiar el color del texto del botón
                    ),
                    child: Text(
                        '                      Ingresar                     '),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Register.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      primary:
                          Colors.black, // Cambiar el color de fondo del botón
                      onPrimary:
                          Colors.white, // Cambiar el color del texto del botón
                    ),
                    child: const Text('Registrarse'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
