import 'package:asm_help1/config/config_global.dart';
import 'package:asm_help1/utils/peticiones.dart';
import 'package:flutter/material.dart';

class GetData {
  PeticionesHttpProvider http = PeticionesHttpProvider();

  final String _medicamento_host = "api/v1/getmedicamentos";

  Future<Map<String, dynamic>> getMedicamento(BuildContext context) async {
    Map<String, dynamic> data = await http.getMethod(
        context: context, table: _medicamento_host, token: pref.token);

    print(data);

    if (data["message"] == 'true') {
      return data;
    } else {
      // alerta(context, code: false, contenido: "Error del servidor");
      print('error');
      return {};
    }

    // return [];
  }
}
