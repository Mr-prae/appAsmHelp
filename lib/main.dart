import 'package:asm_help1/routes/rutas.dart';
import 'package:asm_help1/src/controlMedicine.dart';
import 'package:asm_help1/src/secondApp.dart';
import 'package:asm_help1/utils/peticiones.dart';
import 'package:asm_help1/utils/preferencia_usuario.dart';
import 'package:flutter/material.dart';
import 'package:asm_help1/src/app.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenciasUsuario().initPrefs();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: GetMaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        routes: Routes.routes,
        title: 'App Login',
        initialRoute:
            pref.islogin ? SecondScreen.routeName : MyAppForm.routeName,
      ),
    );
  }
}
