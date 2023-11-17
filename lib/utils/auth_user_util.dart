import 'package:asm_help1/src/app.dart';
import 'package:asm_help1/src/secondApp.dart';
import 'package:asm_help1/src/widget/load.dart';
import 'package:asm_help1/utils/get_data.dart';
import 'package:asm_help1/utils/peticiones.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:http/http.dart' as http;

class AuthUserUtil {
  PeticionesHttpProvider httpProvider = PeticionesHttpProvider();
  final String _correo;
  final String _password;

  AuthUserUtil({required String correo, required String password})
      : _correo = correo,
        _password = password;

  auth(BuildContext context) async {
    load(context);
    Map<String, String> credenciales = {
      'username': _correo,
      'password': _password
    };

    Map<String, dynamic> resp = await httpProvider.postMethod(
      context: context,
      body: credenciales,
      table: 'api/v1/login',
    );
    try {
      pref.name = resp['data']['user']['nombre'];
      pref.email = resp['data']['user']['email'];
      pref.my_id = resp['data']['user']['id'].toString();
      pref.document = resp['data']['user']['number_document'].toString();
      pref.token = resp['data']['data']['access_token'];
      pref.primeraVez = "true";
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

      pref.islogin = true;
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SecondScreen(),
      ));
    } catch (e) {
      pref.islogin = false;

      Get.back();
    }
  }
}
//Julioooooooooo si un celular nuevoo, le ponen el wasa, se pierde lo del wasa web¿
// es lo mas probable osea le ponen el whatsaap al celular,  y antes estaba en whatsasap web?