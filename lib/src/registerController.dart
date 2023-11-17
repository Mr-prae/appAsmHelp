import 'dart:convert';

import 'package:asm_help1/config/config_global.dart';
import 'package:asm_help1/src/app.dart';
import 'package:asm_help1/src/code.dart';
import 'package:asm_help1/src/response.dart';
import 'package:asm_help1/utils/peticiones.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterController {
  TextEditingController nombre = TextEditingController();
  TextEditingController contrasena = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController identificacion = TextEditingController();
  TextEditingController code = TextEditingController();

  Future<ResponseVo> sendFrom(controller) async {
    var headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer ${pref.token}",
    };

    var request = http.MultipartRequest(
        'POST', Uri.parse(ConfigGlobal.serverBackend + '/api/v1/user'));
    print(nombre.text);
    request.fields.addAll({
      'nombre': controller.nombre.text.trim(),
      'email': controller.correo.text.trim(),
      'telefono': controller.telefono.text.trim(),
      'number_document': controller.identificacion.text.trim(),
      'password': controller.contrasena.text,
      'code': code.text.trim(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    // Get.back();
    print(response.statusCode);
    print(response.request);

    String resp = await response.stream.transform(utf8.decoder).join();

    if (response.statusCode == 200) {
      return ResponseVo(
          success: true,
          data: resp,
          message: "Ok",
          statusCode: response.statusCode);
    } else {
      return ResponseVo(
          success: false,
          data: resp,
          message: "Error",
          statusCode: response.statusCode);
    }

    // return {};
  }

  void submit(controller, BuildContext context) async {
    try {
      ResponseVo response = await sendFrom(controller);
      Map<dynamic, dynamic> decodeResp = json.decode(response.data);
      print(decodeResp);
      print(decodeResp['message'].toString().trim());
      if (decodeResp['success']) {
        if (decodeResp['message'].toString().trim() == 'code generado') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Code(
              controller: controller,
            ),
          ));

          return;
        }

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MyAppForm()));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
