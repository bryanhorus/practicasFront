import 'package:flutter/cupertino.dart';
import 'package:tenic_api/resource/constants.dart';

class TecnicoNavigator {
  static void goToHome(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        Constants.homeRoute, (Route<dynamic> route) => false);
  }
  static void goToPerfilCoordinador(BuildContext context) {
    Navigator.pushNamed(context, Constants.perfilCoordinadorRoute);
  }
  static void goToRegistrarObservacion(BuildContext context) {
    Navigator.pushNamed(context, Constants.registrarobservacionRoute);
  }
}
