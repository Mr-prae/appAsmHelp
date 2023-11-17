import 'package:asm_help1/main.dart';
import 'package:asm_help1/src/app.dart';
import 'package:asm_help1/utils/peticiones.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  static String routeName = 'menu';
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(pref.name),
            accountEmail: Text(pref.email),
            decoration: BoxDecoration(
              color: Color.fromARGB(
                  255, 37, 56, 167), // Cambia el color de fondo aquí
            ),
          ),
          ListTile(
            leading: Icon(Icons.power_off_sharp),
            title: const Text('Cerrar sesion'),
            onTap: () {
              pref.islogin = false;
              pref.my_id = '';
              pref.email = '';

              PeticionesHttpProvider()
                  .postMethod(table: "api/v1/logout", token: pref.token);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MyAppForm(),
              ));
              // Define la acción al hacer clic en "Gestión de Medicamentos"
            },
          ),
        ],
      ),
    );
  }
}
