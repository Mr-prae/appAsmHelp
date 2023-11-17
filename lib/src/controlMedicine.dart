// ignore: file_names
import 'dart:convert';

import 'package:asm_help1/config/config_global.dart';
import 'package:asm_help1/src/widget/load.dart';
import 'package:asm_help1/src/widget/select.dart';
import 'package:asm_help1/src/widget/select_item.dart';
import 'package:asm_help1/utils/peticiones.dart';
import 'package:flutter/material.dart';
import 'package:asm_help1/src/secondApp.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';

class ControlMedication extends StatefulWidget {
  static String routeName = 'controlMedicine';
  const ControlMedication({Key? key});

  @override
  State<ControlMedication> createState() => _ControlMedicationState();
}

class _ControlMedicationState extends State<ControlMedication> {
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
  }

  List<SelectItem> opciones() {
    List<SelectItem> lista = [];

    for (var medicamentos in filteredItems) {
      lista.add(SelectItem(
          value: medicamentos['id'].toString(), key: medicamentos['nombre']));
    }
    return lista;
  }

  SelectItem medicamentosSelect = SelectItem(key: '', value: '');

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
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SecondScreen(),
                          ));
                        },
                        icon: Icon(
                          Icons.home,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Select(
                    icon: Icons.arrow_drop_down,
                    description: '',
                    onChangue: () {},
                    width: 100,
                    label: 'Selecciona el medicamento',
                    curretValue: medicamentosSelect,
                    listValues: opciones()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: Text('Este es un mensaje flotante!',
                          style: TextStyle(color: Colors.black)),
                      duration: Duration(seconds: 3),
                      backgroundColor: Colors.black,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    print(pref.medicamentos);
                    List<Map<String, dynamic>> editing = [];
                    editing = pref.medicamentos;
                    // Acción a realizar al hacer clic en el botón
                    int indice = -1;
                    print(medicamentosSelect.value.toString() + "opcoo");

                    for (var medicamentos in editing) {
                      indice++;
                      print(medicamentos['id']);
                      if (medicamentosSelect.value.toString() ==
                          medicamentos['id'].toString()) {
                        String claveActualizar = "cantidad";
                        final int cantidad = medicamentos['cantidad'] - 1;
                        if (indice < editing.length &&
                            editing[indice].containsKey(claveActualizar)) {
                          editing[indice][claveActualizar] = cantidad;

                          if (cantidad == -1) {
                            floadMessage(
                                titulo: 'Medicamento agotado',
                                mensaje: 'Reponer medicamento');
                            return;
                          }
                          print(editing[indice][claveActualizar].toString() +
                              'cantidad cambiada');

                          pref.medicamentos = editing;
                          setState(() {
                            filteredItems = List.from(pref.medicamentos);
                          });
                          editing = [];
                        } else {
                          print(
                              'Índice fuera de rango o la clave no existe en el mapa');
                        }
                      }
                      ;
                    }

                    print(pref.medicamentos[0]);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    primary: Colors.blue, // Puedes personalizar el color
                  ),
                  child: Container(
                    width: 140,
                    height: 140,
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 99, // Puedes personalizar el color
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                'Añadir usos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              // Lista de notificaciones
              Expanded(
                child: ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 217, 217, 217),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Nombre'),
                                        Text('Dosis'),
                                        Text('Cantidad'),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            filteredItems[index]['nombre'],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                              filteredItems[index]['dosis']),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            filteredItems[index]['cantidad']
                                                .toString(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
