import 'package:tenic_api/resource/constants.dart';
import 'package:flutter/material.dart';

class TecniNavigator {
  static void goToHome(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        Constants.homeRoute, (Route<dynamic> route) => false);
  }
  //Usuarios
  static void goToRegistrarUsuario(BuildContext context) {
    Navigator.pushNamed(context, Constants.registroRoute);
  }
    static void goToActualizarUsuario(BuildContext context) {
    Navigator.pushNamed(context, Constants.actualizarUsuarioRoute);
  }
  static void goToListaUsuarios(BuildContext context) {
    Navigator.pushNamed(context, Constants.listaUsuariosRoute);
  }
  //Departamentos
  static void goToRegistrarDepartamento(BuildContext context) {
    Navigator.pushNamed(context, Constants.registrarDepartamentosRoute);
  }
  static void goToActualizarDepartamento(BuildContext context) {
    Navigator.pushNamed(context, Constants.actualizarDepartamentosRoute);
  }
  static void goToListaDepartamento(BuildContext context) {
    Navigator.pushNamed(context, Constants.listaDepartamentosRoute);
  }
  //Municipios
  static void goToRegistrarMunicipio(BuildContext context) {
    Navigator.pushNamed(context, Constants.registrarMunicipiosRoute);
  }
  static void goToActualizarMunicipio(BuildContext context) {
    Navigator.pushNamed(context, Constants.actualizarMunicipioRoute);
  }
  static void goToListaMuncipio(BuildContext context) {
    Navigator.pushNamed(context, Constants.listaMunicipiosRoute);
  }
  //Antenas
  static void goToRegistrarAntenaUi(BuildContext context) {
    Navigator.pushNamed(context, Constants.registrarantenaRoute);
  }
  static void goToActualizarAntena(BuildContext context) {
    Navigator.pushNamed(context, Constants.actualizarAntenaRoute);
  }
  static void goToListaAntena(BuildContext context) {
    Navigator.pushNamed(context, Constants.listaAntenasRoute);
  }
  //Torres
  static void goToRegistrarTorre(BuildContext context) {
    Navigator.pushNamed(context, Constants.registrarTorreRoute);
  }
  static void goToActualizarTorre(BuildContext context) {
    Navigator.pushNamed(context, Constants.actualizarTorreRoute);
  }
  static void goToListaTorre(BuildContext context) {
    Navigator.pushNamed(context, Constants.listaTorresRoute);
  }
  static void goToAsignarTorre(BuildContext context) {
    Navigator.pushNamed(context, Constants.asignarTorresRoute);
  }
  
  //Home
  static void goToHomeCoordinador(BuildContext context) {
    Navigator.pushNamed(context, Constants.homeCoordinadorRoute);
  }
  //Perfil
  static void goToPerfilCoordinador(BuildContext context) {
    Navigator.pushNamed(context, Constants.perfilCoordinadorRoute);
  }








}