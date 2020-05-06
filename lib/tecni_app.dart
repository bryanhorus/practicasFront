import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tenic_api/UI/antena/asignar_antena.dart';
import 'package:tenic_api/UI/antena/lista_antenas_asignadas.dart';
import 'package:tenic_api/UI/antena/registrar_antena.dart';
import 'package:tenic_api/UI/departamento/actualizar_departamento.dart';
import 'package:tenic_api/UI/departamento/crear_Departamento.dart';
import 'package:tenic_api/UI/login.dart';
import 'package:tenic_api/UI/municipio/actualizar_municipio.dart';
import 'package:tenic_api/UI/municipio/lista_municipio.dart';
import 'package:tenic_api/UI/observation/lista_observation.dart';

import 'package:tenic_api/UI/tecnico/menu_tecnico.dart';
import 'package:tenic_api/UI/tecnico/observacion.dart';
import 'package:tenic_api/UI/torre/registrar_torre.dart';
import 'package:tenic_api/UI/usuario/actualizar_usuario.dart';
import 'package:tenic_api/UI/usuario/lista_usuarios.dart';
import 'package:tenic_api/UI/usuario/registro_usuarios.dart';
import 'package:tenic_api/resource/constants.dart';
import 'package:flutter/cupertino.dart';
import 'UI/antena/actualizar_antena.dart';
import 'UI/antena/lista_antenas.dart';
import 'UI/departamento/lista_departamentos.dart';
import 'UI/home_coordinador.dart';
import 'UI/municipio/registrar_municipio.dart';
import 'UI/torre/actualizar_torre.dart';
import 'UI/torre/lista_torre.dart';
import 'UI/usuario/perfil.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      initialRoute: Constants.homeRoute,
      routes: {
        Constants.homeRoute: (context) => LoginPage(),
        Constants.homeCoordinadorRoute: (context) => HomeCoordinador(),
        Constants.perfilCoordinadorRoute: (context) => ProfilePageDesign(),
        //antena
        Constants.registrarantenaRoute: (context) => RegistrarAntena(),
        Constants.actualizarAntenaRoute: (context) => ActualizarAntena(),
        Constants.listaAntenasRoute:(context) => ListaAntenas(),
        Constants.asignarAntenaRoute:(context) => AsignarAntenaPage(),
        Constants.listaAsignarAntenaRoute:(context) => ListaAntenasAsignadas(),
        //usuario
        Constants.registroRoute: (context) => TextFormFieldDemo(),
        Constants.actualizarUsuarioRoute: (context) => ActualizarUsuario(),
        Constants.listaUsuariosRoute: (context) => ListaUsuarios(),
        //departamento
        Constants.registrarDepartamentosRoute: (context) => CrearDepartamento(),
        Constants.actualizarDepartamentosRoute: (context) => ActualizarDepartamento(),
        Constants.listaDepartamentosRoute: (context) => ListaDpto(),
        //municipio
        Constants.registrarMunicipiosRoute: (context) => CrearMunicipio(),
        Constants.actualizarMunicipioRoute: (context) => ActualizarMunicipio(),
        Constants.listaMunicipiosRoute: (context) => ListaMunicipio(),
        //torre
        Constants.registrarTorreRoute: (context) => CrearTorre(),
        Constants.actualizarTorreRoute: (context) => ActualizarTorre(),
        Constants.listaTorresRoute: (context) => ListaTorre(), 
        //Observacion
        Constants.homeTecnicoRoute: (context) => HomeTecnico(),
        Constants.registrarobservacionRoute: (context) => CrearObservacion(),
        Constants.observacionesRoute: (context) => ListaObservation(),    
      },
    );
  }
}