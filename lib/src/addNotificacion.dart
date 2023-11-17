import 'package:asm_help1/src/secondApp.dart';
import 'package:asm_help1/src/widget/select.dart';
import 'package:asm_help1/src/widget/select_item.dart';
import 'package:asm_help1/utils/peticiones.dart';
import 'package:flutter/material.dart';

class AddNotification extends StatefulWidget {
  static String routeName = 'AddNotificaciones';
  const AddNotification({super.key});

  @override
  State<AddNotification> createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {
  List<Map<String, dynamic>> items = [];
  List<Map<String, dynamic>> filteredItems = [];

  @override
  void initState() {
    // TODO: implement initState
    // PeticionesHttpProvider medicinas = PeticionesHttpProvider();

    super.initState();
    items = pref.medicamentos;

    filteredItems = List.from(items);
  }

  actualizarselect() {
    List<Widget> selectMedic = [];
    print(selectMedic);

    selectMedic = [];
    setState(() {});
  }

  List<SelectItem> opciones() {
    List<SelectItem> lista = [];

    for (var medicamentos in filteredItems) {
      lista.add(SelectItem(
          value: medicamentos['id'].toString(), key: medicamentos['nombre']));
    }
    return lista;
  }

  TimeOfDay hora = TimeOfDay.now();
  SelectItem medicamentosSelect = SelectItem(key: '', value: '');

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(), // Hora inicial
    );
    if (selectedTime != null) {
      print('Hora seleccionada: ${selectedTime.format(context)}');
      // Puedes realizar acciones con la hora seleccionada aquí
    }
  }

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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Select(
                    icon: Icons.arrow_drop_down,
                    description: '',
                    onChangue: () {
                      setState(() {});
                    },
                    width: 100,
                    label: 'Selecciona el medicamento',
                    curretValue: medicamentosSelect,
                    listValues: opciones()),
              ),
              Text('escoja la frecuencia'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: Colors.black,
                        onPressed: () {},
                        child: Text('personalizada'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: Colors.black,
                        onPressed: () {},
                        child: Text('8 horas'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: const Color.fromARGB(78, 0, 0, 0),
                        onPressed: () {},
                        child: Text('Diario'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: const Color.fromARGB(87, 0, 0, 0),
                        onPressed: () {},
                        child: Text('Semanal'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: const Color.fromARGB(74, 0, 0, 0),
                        onPressed: () {},
                        child: Text('semanal'),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.black,
              ),
              MaterialButton(
                onPressed: () {
                  _selectTime(context);
                },
                child: Text('${hora.format(context)}'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
