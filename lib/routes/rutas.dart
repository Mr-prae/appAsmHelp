import 'package:asm_help1/src/app.dart';
import 'package:asm_help1/src/controlMedicine.dart';
import 'package:asm_help1/src/gMedicine.dart';
import 'package:asm_help1/src/informe.dart';
import 'package:asm_help1/src/myDrawe.dart';
import 'package:asm_help1/src/notifications.dart';
import 'package:asm_help1/src/perfil.dart';
import 'package:asm_help1/src/register.dart';
import 'package:asm_help1/src/secondApp.dart';
import 'package:asm_help1/src/addNotificacion.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    MyAppForm.routeName: (contex) => MyAppForm(),
    Register.routeName: (context) => const Register(),
    SecondScreen.routeName: (context) => const SecondScreen(),
    ControlMedication.routeName: (context) => const ControlMedication(),
    Perfil.routeName: (context) => const Perfil(),
    Menu.routeName: (context) => const Menu(),
    GestionMedicine.routeName: (context) => const GestionMedicine(),
    NotificationScreen.routeName: (context) => const NotificationScreen(),
    Informe.routeName: (context) => const Informe(),
    AddNotification.routeName: (context) => const AddNotification(),
    
  };
}
