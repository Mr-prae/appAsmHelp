import 'dart:convert';

import 'package:asm_help1/config/config_global.dart';
import 'package:asm_help1/src/notifications.dart';
import 'package:asm_help1/src/secondApp.dart';
import 'package:asm_help1/src/widget/load.dart';
import 'package:asm_help1/utils/get_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:asm_help1/utils/peticiones.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GestionMedicine extends StatefulWidget {
  static String routeName = 'gestionMedicine';
  const GestionMedicine({super.key});

  @override
  _GestionMedicineState createState() => _GestionMedicineState();
}

class _GestionMedicineState extends State<GestionMedicine> {
  TextEditingController nombreMedicamentoController = TextEditingController();
  TextEditingController dosisMedicamentoController = TextEditingController();
  TextEditingController frecuenciaMedicamentoController =
      TextEditingController();
  TextEditingController cantidadMedicamentoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SafeArea(
                child: Row(
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
                              Navigator.pushNamed(
                                  context, NotificationScreen.routeName);
                            },
                            icon: Icon(
                              Icons.notifications,
                              color: Colors.blue,
                            )),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, SecondScreen.routeName);
                            },
                            icon: Icon(
                              Icons.home,
                              color: Colors.blue,
                            ))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text('Informacion medicamento',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline)),
              ),
              const SizedBox(height: 60),
              buildTextField('Nombre de medicamento', (value) {},
                  nombreMedicamentoController),
              const SizedBox(height: 30),
              buildDosisField(),
              const SizedBox(height: 30),
              buildTextField('Frecuencia del medicamento', (value) {},
                  frecuenciaMedicamentoController),
              const SizedBox(height: 30),
              buildTextField('Cantidad del medicamento', (value) {},
                  cantidadMedicamentoController),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  // Lógica para el botón de registro
                  load(context);
                  submitMedicine(context);
                  Get.back();
                  floadMessage(
                      titulo: 'Medicamento agregado correctamente',
                      mensaje: '');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                ),
                child: Text('Registrar medicamento'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                ),
                child: Text('Volver'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  submitMedicine(BuildContext context) async {
    PeticionesHttpProvider httpProvider = PeticionesHttpProvider();
    Map<String, String> medicamento = {
      'usuario_id': pref.my_id,
      'nombre': nombreMedicamentoController.text,
      'dosis': dosisMedicamentoController.text,
      'frecuencia': frecuenciaMedicamentoController.text,
      'cantidad': cantidadMedicamentoController.text,
    };
    Map<String, dynamic> resp = await httpProvider.postMethod(
      context: context,
      body: medicamento,
      table: 'api/v1/medicamento',
    );

    GetData obtenerData = GetData();

    // ignore: use_build_context_synchronously
    final respuesta = await obtenerData.getMedicamento(context);
    List<dynamic> listaDinamica =
        respuesta['data']; // Tu List<dynamic> existente
    List<Map<String, dynamic>> listaDeMapas =
        List<Map<String, dynamic>>.from(listaDinamica);

    //  if(resp['data']['success']) floadMessage(titulo: 'Agregado correctamente',mensaje: 'exitoso');
    if (resp['data']['success']) print('agregado correctamente');
    pref.medicamentos = listaDeMapas;
    print('preferencia');
    print(pref.medicamentos);
  }

  Widget buildDosisField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: TextField(
                controller: dosisMedicamentoController,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: 'Dosis',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.all(6.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hintText, void Function(String)? onChanged,
      TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: EdgeInsets.all(20.0),
        ),
      ),
    );
  }
}
