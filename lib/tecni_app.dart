import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tenic_api/UI/antena/asignar_antena.dart';
import 'package:tenic_api/UI/antena/buscar_asignacion.dart';
import 'package:tenic_api/UI/antena/lista_antenas_asignadas.dart';
import 'package:tenic_api/UI/antena/registrar_antena.dart';
import 'package:tenic_api/UI/departamento/actualizar_departamento.dart';
import 'package:tenic_api/UI/departamento/crear_Departamento.dart';
import 'package:tenic_api/UI/enviar_correo.dart';
import 'package:tenic_api/UI/login.dart';
import 'package:tenic_api/UI/municipio/actualizar_municipio.dart';
import 'package:tenic_api/UI/municipio/lista_municipio.dart';
import 'package:tenic_api/UI/observation/buscar_observacion.dart';
import 'package:tenic_api/UI/observation/lista_busqueda.dart';
import 'package:tenic_api/UI/observation/lista_observation.dart';
import 'package:tenic_api/UI/perfil.dart';
import 'package:tenic_api/UI/tecnico/menu_tecnico.dart';
import 'package:tenic_api/UI/tecnico/observacion.dart';
import 'package:tenic_api/UI/torre/buscar_torre.dart';
import 'package:tenic_api/UI/torre/registrar_torre.dart';
import 'package:tenic_api/UI/usuario/actualizar_usuario.dart';
import 'package:tenic_api/UI/usuario/lista_usuarios.dart';
import 'package:tenic_api/UI/usuario/recuperar_contrasena.dart';
import 'package:tenic_api/UI/usuario/registro_usuarios.dart';
import 'package:tenic_api/resource/constants.dart';
import 'package:flutter/cupertino.dart';
import 'UI/antena/actualizar_antena.dart';
import 'UI/antena/lista_antenas.dart';
import 'UI/departamento/lista_departamentos.dart';
import 'UI/home_coordinador.dart';
import 'UI/municipio/registrar_municipio.dart';
import 'UI/tecnico/listar.dart';
import 'UI/torre/actualizar_torre.dart';
import 'UI/torre/lista_torre.dart';
import 'UI/actualiazarc.dart';
import 'resource/constants.dart';

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
        Constants.enviarcorreoRoute: (context) => EnviarEmailPage(),
        //antena
        Constants.registrarantenaRoute: (context) => RegistrarAntena(),
        Constants.actualizarAntenaRoute: (context) => ActualizarAntena(),
        Constants.listaAntenasRoute:(context) => ListaAntenas(),
        Constants.asignarAntenaRoute:(context) => AsignarAntenaPage(),
        Constants.listaAsignarAntenaRoute:(context) => ListaAntenasAsignadas(),
        Constants.listaratenas:(context) => Asignadastecnico(),
        Constants.buscarAsignacionRoute: (context) => ListaBuscarAsignacionPage(),
        //usuario
        Constants.registroRoute: (context) => TextFormFieldDemo(),
        Constants.actualizarUsuarioRoute: (context) => ActualizarUsuario(),
        Constants.listaUsuariosRoute: (context) => ListaUsuarios(),
        Constants.recuperarContrasenaRoute: (context) => RecuperarContrasena(),
        Constants.perfilCoordinadorRoute: (context) => PerfilPage(),
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
        Constants.buscarTorreRoute: (context) => ListaBuscarTorrePage(),
        //Observacion
        Constants.homeTecnicoRoute: (context) => HomeTecnico(),
        Constants.registrarobservacionRoute: (context) => CrearObservacion(),
        Constants.observacionesRoute: (context) => ListaObservation(),
        Constants.buscarObservacionRoute: (context) => BuscarObservacionPage(), 
        Constants.listaBusquedaRoute: (context) => ListaBusquedaPage(),
        //actualizar
        Constants.actualuzarContra: (context)=>  Actualizar(),
      },
    );
  }
}