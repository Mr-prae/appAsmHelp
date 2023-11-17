import 'package:asm_help1/src/controlMedicine.dart';
import 'package:asm_help1/src/gMedicine.dart';
import 'package:asm_help1/src/informe.dart';
import 'package:asm_help1/src/myDrawe.dart';
import 'package:asm_help1/src/notifications.dart';
import 'package:asm_help1/src/perfil.dart';
import 'package:asm_help1/utils/peticiones.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class SecondScreen extends StatelessWidget {
  static String routeName = 'seccond';
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const column = Column(
      children: [],
    );
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/azul.png"),
                    alignment: Alignment.topLeft),
              ),
              child: SizedBox(
                  height: 300,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Perfil.routeName);
                                  },
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.blue,
                                    size: 60,
                                  )),
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              pref.name,
                              style: TextStyle(
                                fontSize:
                                    20, // Ajusta el tamaño de la fuente según tus necesidades
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, Menu.routeName);
                              },
                              icon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.menu,
                                  size: 50,
                                ),
                              ))
                        ],
                      )
                    ],
                  ))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: MaterialButton(
                  minWidth: size.width * 0.35,
                  height: 150,
                  color: Color.fromARGB(231, 0, 75, 173),
                  onPressed: () {
                    Navigator.pushNamed(context, NotificationScreen.routeName);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        15.0), // Ajusta el radio según tus necesidades
                    side: BorderSide(color: Colors.black, width: 3),
                  ),
                  child: Column(children: [
                    Text(
                      'Notificaciones',
                      style: TextStyle(
                        fontSize:
                            20, // Ajusta el tamaño de la fuente según tus necesidades
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.notifications_active_rounded,
                      color: Colors.white,
                      size: 60,
                    )
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MaterialButton(
                  minWidth: size.width * 0.4,
                  height: 150,
                  color: Color.fromARGB(231, 0, 75, 173),
                  onPressed: () {
                    Navigator.pushNamed(context, ControlMedication.routeName);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        15.0), // Ajusta el radio según tus necesidades
                    side: BorderSide(color: Colors.black, width: 3),
                  ),
                  child: Column(children: [
                    Text(
                      'Advertencia',
                      style: TextStyle(
                        fontSize:
                            20, // Ajusta el tamaño de la fuente según tus necesidades
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.warning_amber_sharp,
                      color: Colors.white,
                      size: 60,
                    )
                  ]),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: MaterialButton(
                  minWidth: size.width * 0.4,
                  height: 150,
                  color: Color.fromARGB(231, 0, 75, 173),
                  onPressed: () {
                    Navigator.pushNamed(context, GestionMedicine.routeName);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        15.0), // Ajusta el radio según tus necesidades
                    side: BorderSide(color: Colors.black, width: 3),
                  ),
                  child: Column(children: [
                    Text(
                      'Gestión',
                      style: TextStyle(
                        fontSize:
                            20, // Ajusta el tamaño de la fuente según tus necesidades
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Medicina',
                      style: TextStyle(
                        fontSize:
                            20, // Ajusta el tamaño de la fuente según tus necesidades
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.medication,
                      color: Colors.white,
                      size: 60,
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MaterialButton(
                  minWidth: size.width * 0.4,
                  height: 150,
                  color: Color.fromARGB(231, 0, 75, 173),
                  onPressed: () {
                    Navigator.pushNamed(context, Informe.routeName);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        15.0), // Ajusta el radio según tus necesidades
                    side: BorderSide(color: Colors.black, width: 3),
                  ),
                  child: Column(children: [
                    Text(
                      'Generar',
                      style: TextStyle(
                        fontSize:
                            20, // Ajusta el tamaño de la fuente según tus necesidades
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'informe',
                      style: TextStyle(
                        fontSize:
                            20, // Ajusta el tamaño de la fuente según tus necesidades
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.insert_drive_file_outlined,
                      color: Colors.white,
                      size: 60,
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
