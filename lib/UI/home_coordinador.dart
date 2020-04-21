import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:tenic_api/UI/antena/lista_antenas.dart';
import 'package:tenic_api/UI/departamento/lista_departamentos.dart';
import 'package:tenic_api/UI/municipio/lista_municipio.dart';
import 'package:tenic_api/UI/perfil.dart';
import 'package:tenic_api/UI/torre/lista_torre.dart';
import 'package:tenic_api/UI/usuario/lista_usuarios.dart';


class HomeCoordinador extends StatefulWidget {
  @override
  HomeCoordinadorState createState() => HomeCoordinadorState();
}

class HomeCoordinadorState extends State<HomeCoordinador> {
  int pageIndex = 0;
  final ListaUsuarios _usuarioUi = new ListaUsuarios();
  final ListaDpto _departamentoUi = new ListaDpto();
  final ListaMunicipio _municipioUi = new ListaMunicipio();
  final ListaTorre _torreUi = new ListaTorre();
  final ListaAntenas _antenaUi = new ListaAntenas();
  final ProfilePageDesign _perfil = new ProfilePageDesign();

  Widget _showPage = new ProfilePageDesign();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _perfil;
        break;
      case 1: 
        return _antenaUi; 
        break;
      case 2:
        return _departamentoUi;
        break;
      case 3:
        return _municipioUi;
        break;
      case 4:
        return _torreUi;
        break;
      case 5:
        return _usuarioUi;
        break;
      default:
        return new Container(child: new Center(child: new Text('ingrese.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: pageIndex,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.perm_identity, size: 30),
            Icon(Icons.settings_input_antenna, size: 30),
            Icon(Icons.place, size: 30),
            Icon(Icons.assessment, size: 30),
            Icon(Icons.add_circle, size: 30),
            Icon(Icons.person_add, size: 30),

          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blue[400],
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Colors.blue,
          child: Center(
            child: _showPage,
          ),
        ));
  }
}
