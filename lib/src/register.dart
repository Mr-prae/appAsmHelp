import 'package:asm_help1/src/registerController.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static String routeName = 'registro';
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final controllers = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 120.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                  'assets/WhatsApp-Image-2023-10-18-at-15.24.37-removebg-preview-removebg-preview.png',
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Color de fondo gris
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: controllers.nombre,
                  decoration: InputDecoration(
                    hintText: 'Nombre',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Color de fondo gris
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: controllers.contrasena,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Color de fondo gris
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: controllers.correo,
                  decoration: InputDecoration(
                    hintText: 'Correo',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Color de fondo gris
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: controllers.telefono,
                  decoration: InputDecoration(
                    hintText: ' Telefono',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Color de fondo gris
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: controllers.identificacion,
                  decoration: InputDecoration(
                    hintText: 'Identificación',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Color de fondo gris
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Lógica para el botón de registro
                  RegisterController().submit(controllers, context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Cambiar el color de fondo del botón
                  onPrimary:
                      Colors.white, // Cambiar el color del texto del botón
                ),
                child: Text('Registrarse'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Cambiar el color de fondo del botón
                  onPrimary:
                      Colors.white, // Cambiar el color del texto del botón
                ),
                child: Text('Volver'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
