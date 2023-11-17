import 'package:asm_help1/src/registerController.dart';
import 'package:flutter/material.dart';

class Code extends StatelessWidget {
  final RegisterController controller;
  Code({super.key, required this.controller});
  // final RegisterController controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Revisa tu correo se genero un codigo'),
                TextFormField(controller: controller.code),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el botón de registro
                    controller.submit(controller, context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary:
                        Colors.black, // Cambiar el color de fondo del botón
                    onPrimary:
                        Colors.white, // Cambiar el color del texto del botón
                  ),
                  child: Text('Registrarse'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
