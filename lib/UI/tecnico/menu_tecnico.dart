import 'package:flutter/material.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/navigator_tecnico.dart';
import 'package:tenic_api/resource/constants.dart';

class HomeTecnico extends StatefulWidget {
  @override
  HomeTecnicoState createState() => HomeTecnicoState();
}

class HomeTecnicoState extends State<HomeTecnico> {
  @override
  Widget build(BuildContext context) {
    var perfil = ListTile(
      leading: Icon(Icons.person_pin),
      title: Text(
        Constants.appBarPerfil,
        style: TextStyle(color: Colors.black),
      ),
      onTap: () => {TecniNavigator.goToPerfilCoordinador(context)},
    );

    var observacion = ListTile(
      leading: Icon(Icons.create),
      title: Text(
        Constants.tittleObservacion,
        style: TextStyle(color: Colors.black),
      ),
      onTap: () => {TecnicoNavigator.goToRegistrarObservacion(context)},
    );

    var antenasAsignadas = ListTile(
      leading: Icon(Icons.settings_input_antenna),
      title: Text(
        Constants.tittleAntenaAsignadas,
        style: TextStyle(color: Colors.black),
      ),
      onTap: () => {},
    );

    var cerrar = ListTile(
      leading: Icon(Icons.exit_to_app),
      title: Text(
        Constants.cerrarSesion,
        style: TextStyle(color: Colors.black),
      ),
      onTap: () => {TecnicoNavigator.goToHome(context)},
    );

    var menu = Drawer(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Bryan Alvarado",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              "Bryan@hotmail.com",
              style: TextStyle(color: Colors.black),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Constants.perfilImage),
                    fit: BoxFit.cover)),
          ),
          Ink(color: Colors.blue, child: perfil),
          observacion,
          antenasAsignadas,
          cerrar
        ],
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text(Constants.appName),
        ),
        drawer: menu,
        body: Center(
            child: Text(
                "")));
  }
}
