import 'package:asm_help1/src/notifications.dart';
import 'package:asm_help1/src/secondApp.dart';
import 'package:flutter/material.dart';
import 'package:asm_help1/utils/peticiones.dart';

class Perfil extends StatelessWidget {
  static String routeName = 'perfil';
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Row(
                  children: [
                    IconClickable(
                      icon: Icons.notifications,
                      iconColor: Colors.indigo,
                      iconSize: screenWidth * 0.09,
                      onPressed: () {
                        Navigator.pushNamed(
                            context, NotificationScreen.routeName);
                      },
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    IconClickable(
                      icon: Icons.home,
                      iconColor: Colors.indigo,
                      iconSize: screenWidth * 0.09,
                      onPressed: () {
                        Navigator.pushNamed(context, SecondScreen.routeName);
                      },
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(screenHeight * 0.1),
                      child: Text(
                        'Perfil',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "TT Norms",
                          fontSize: screenWidth * 0.09,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.black, // Color de la línea
                      height: 2.0, // Grosor de la línea
                      width: screenWidth * 1, // Ancho de la línea
                      margin: EdgeInsets.only(
                          top: screenHeight * 0.5), // Margen inferior
                    ),
                    Container(
                      color: Colors.black, // Color de la línea
                      height: 2.0, // Grosor de la línea
                      width: screenWidth * 1.0, // Ancho de la línea
                      margin: EdgeInsets.only(
                          top: screenHeight * 0.2), // Margen inferior
                    ),
                  ],
                ),
              ),
              Positioned(
                top: screenHeight * 0.18,
                left: screenWidth * 0.5 - screenWidth * 0.2,
                child: CircleAvatar(
                  radius: screenWidth * 0.20,
                  backgroundColor: Colors.grey,
                  backgroundImage: const AssetImage('assets/perfil.png'),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Esto centrará los elementos en el eje vertical
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        pref.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Correo:' + pref.email,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Esto centrará los elementos en el eje vertical
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Documento: ' + pref.document,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Container(
                  alignment: Alignment.center,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Contactanos',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: "TT Norms",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '• Correo electronico',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '• Numero telefonico',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '• WhatsApp',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '• Instagram',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '• Facebook',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconClickable extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final VoidCallback onPressed;

  const IconClickable({
    required this.icon,
    required this.iconColor,
    required this.iconSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
      onPressed: onPressed,
    );
  }
}
