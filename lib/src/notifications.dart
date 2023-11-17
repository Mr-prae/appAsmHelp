import 'package:asm_help1/src/addNotificacion.dart';
import 'package:asm_help1/src/secondApp.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  static String routeName = 'Notificaciones';
  const NotificationScreen({Key? key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> notificaciones = [
    {
      'medicamento': "push",
      "hora": DateTime.now(),
      "descripcion": "50 mil kg de marihuana"
    },
    {
      'medicamento': "push",
      "hora": DateTime.now(),
      "descripcion": "peasasasasaspino"
    },
    {
      'medicamento': "push",
      "hora": DateTime.now(),
      "descripcion": "tomar medicamento"
    },
    {
      'medicamento': "push",
      "hora": DateTime.now(),
      "descripcion": "tomar medicamento"
    },
    {
      'medicamento': "push",
      "hora": DateTime.now(),
      "descripcion": "tomar medicamento"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 100,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SecondScreen(),
                            ));
                          },
                          icon: Icon(
                            Icons.notifications,
                            color: Colors.blue,
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SecondScreen(),
                            ));
                          },
                          icon: Icon(
                            Icons.home,
                            color: Colors.blue,
                          ))
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text('Notificaciones',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline)),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: notificaciones.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 217, 217, 217)),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        notificaciones[index]['descripcion']),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(
                                        notificaciones[index]['hora']
                                            .toIso8601String()
                                            .substring(11, 19),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          notificaciones[index]['medicamento']),
                                      Text('se repite')
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.delete)),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.circle,
                                    color: Colors.green,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: MaterialButton(
                  shape: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  textColor: Colors.white,
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pushNamed(context, AddNotification.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Icon(Icons.add), Text('Agregar recordatorios')],
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
