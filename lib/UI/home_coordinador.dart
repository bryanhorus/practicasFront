import 'package:flutter/material.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/resource/constants.dart';

class HomeCoordinador extends StatefulWidget {
  @override
  HomeCoordinadorState createState() => HomeCoordinadorState();
}

class HomeCoordinadorState extends State<HomeCoordinador> {
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

    var torre = ListTile(
      leading: Icon(Icons.text_fields),
      title: Text(
        Constants.tittleTorre,
        style: TextStyle(color: Colors.black),
      ),
      onTap: () => {TecniNavigator.goToListaTorre(context)},
    );

    var antena = ListTile(
      leading: Icon(Icons.settings_input_antenna),
      title: Text(
        Constants.tittleAntena,
        style: TextStyle(color: Colors.black),
      ),
      onTap: () => {TecniNavigator.goToListaAntena(context)},
    );

    var departamento = ListTile(
      leading: Icon(Icons.flag),
      title: Text(
        Constants.tittleDepartamento,
        style: TextStyle(color: Colors.black),
      ),
      onTap: () => {TecniNavigator.goToListaDepartamento(context)},
    );
    var usuarios = ListTile(
      leading: Icon(Icons.person_add),
      title: Text(
        Constants.tittleUsuario,
        style: TextStyle(color: Colors.black),
      ),
      onTap: () => {TecniNavigator.goToListaUsuarios(context)},
    );

    var municipio = ListTile(
      leading: Icon(Icons.pin_drop),
      title: Text(
        Constants.tittleMunicipio,
        style: TextStyle(color: Colors.black),
      ),
      onTap: () => {TecniNavigator.goToListaMuncipio(context)},
    );

    var asignar = ListTile(
      leading: Icon(Icons.fiber_new),
      title: Text(
        Constants.tittleAsignarAntena,
        style: TextStyle(color: Colors.black),
      ),
      onTap: () => {TecniNavigator.goToAsignarAntena(context)},
    );

    var observacion = ListTile(
      leading: Icon(Icons.pin_drop),
      title: Text(
        Constants.tittleListaObservaciones,
        style: TextStyle(color: Colors.black),
      ),
      onTap: () => {TecniNavigator.goToObservaciones(context)},
    );
    var cerrar = ListTile(
      leading: Icon(Icons.exit_to_app),
      title: Text(
        Constants.cerrarSesion,
        style: TextStyle(color: Colors.black),
      ),
      onTap: () => {TecniNavigator.goToHome(context)},
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
          torre,
          departamento,
          municipio,
          usuarios,
          antena,
          asignar,
          observacion,
          cerrar
        ],
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text(Constants.appName),
        ),
        drawer: menu,
        body: ListView(
          children: <Widget>[
            Card(
              elevation: 25,
              child: ListTile(
                leading: Icon(Icons.center_focus_strong),
                title: Text("ANTENA GLOBAL"),
                subtitle: Text(
                    'Nuestra Compañia ofrece los mejores servicios, para la comunidad' +
                        'donde puedes estar mas cerca de tu familia '),
              ),
            ),
            //
            Card(
              elevation: 24,
              child: ListTile(
                leading: Icon(Icons.center_focus_strong),
                title: Text("Mision"),
                subtitle: Text(
                    "Generamos valor a la sociedad, clientes y accionistas, y  todos los grupos de interés, con una gestión innovadora, eficiente, neutral y de calidad en la prestación de servicios de redes compartidas e infraestructuras de telecomunicaciones, a través de la ilusión y el desarrollo de nuestro equipo de colaboradores."),
              ),
            ),

            //
            Card(
              elevation: 25,
              child: ListTile(
                leading: Icon(Icons.center_focus_strong),
                title: Text("Vision"),
                subtitle: Text(
                    'Líder en Colombia en soluciones de infraestructuras de telecomunicaciones. '),
              ),
            ),
          ],
        ));

    // Center(
    //  child: Text(
    //    "Aqui podemos hacer como una introducción a la empresa o la app, algo asi, como un texto y una imagen")));
  }
}
