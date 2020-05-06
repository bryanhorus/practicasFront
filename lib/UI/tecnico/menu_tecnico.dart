import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/inicio_sesion_bloc.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/navigator_tecnico.dart';
import 'package:tenic_api/repository/repository.dart';
import 'package:tenic_api/resource/constants.dart';

class HomeTecnico extends StatefulWidget {
  @override
  HomeTecnicoState createState() => HomeTecnicoState();
}

class HomeTecnicoState extends State<HomeTecnico> {

    final InicioSesionBloc inicioSesionBloc = InicioSesionBloc();

  Repository repository = Repository();

  String nombre = "";
  String correo = "";
  String apellido = "";

  @override
  initState() {
    super.initState();
    _Carga();
  }

  void _handleSubmitted() async {
    await inicioSesionBloc.cerrarSesion();
    TecniNavigator.goToHome(context);
  }

  void _Carga() async{

  nombre = await repository.getLocalNombre();
  apellido = await repository.getLocalApellido();
  correo = await repository.getLocalCorreo();
  setState(() {
        nombre;
        correo;
        apellido;
      });
  }
  @override
  Widget build(BuildContext context) {

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

    var actualizar = ListTile(
      leading: Icon(Icons.pin_drop),
      title: Text(
        Constants.titleactualizarcontra,
        style: TextStyle(color: Colors.black),
      ),
      onTap: () => {TecniNavigator.gotoactualizar(context)},
    );
    var cerrar = ListTile(
      leading: Icon(Icons.exit_to_app),
      title: Text(
        Constants.cerrarSesion,
        style: TextStyle(color: Colors.black),
      ),
      onTap: _handleSubmitted,
    );

    var menu = Drawer(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              nombre +' '+ apellido,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              correo,
              style: TextStyle(color: Colors.black),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Constants.perfilImage),
                    fit: BoxFit.cover)),
          ),
          Ink(color: Colors.blue, child: observacion),
          antenasAsignadas,
          actualizar,
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
            Card(
              elevation: 24,
              child: ListTile(
                leading: Icon(Icons.center_focus_strong),
                title: Text("Mision"),
                subtitle: Text(
                    "Generamos valor a la sociedad, clientes y accionistas, y  todos los grupos de interés, con una gestión innovadora, eficiente, neutral y de calidad en la prestación de servicios de redes compartidas e infraestructuras de telecomunicaciones, a través de la ilusión y el desarrollo de nuestro equipo de colaboradores."),
              ),
            ),
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
  }
}
