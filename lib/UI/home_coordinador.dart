import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:tenic_api/UI/antena/antenas.dart';
import 'package:tenic_api/UI/departamento/departamento.dart';
import 'package:tenic_api/UI/municipio/municipio.dart';
import 'package:tenic_api/UI/perfil.dart';
import 'package:tenic_api/UI/torre/torre.dart';
import 'package:tenic_api/UI/usuario/usuario.dart';

class HomeCoordinador extends StatefulWidget {
  @override
  HomeCoordinadorState createState() => HomeCoordinadorState();
}

class HomeCoordinadorState extends State<HomeCoordinador> {
  int pageIndex = 0;
  final UsuarioUi _usuarioUi = new UsuarioUi();
  final DepartamentoUi _departamentoUi = new DepartamentoUi();
  final MunicipioUi _municipioUi = new MunicipioUi();
  final TorreUi _torreUi = new TorreUi();
  final AntenaUi _antenaUi = new AntenaUi();
  final ProfilePageDesign _perfil = new ProfilePageDesign();

  Widget _showPage = new ProfilePageDesign();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _perfil;
        break;
      case 1:
        return _usuarioUi;
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
        return _antenaUi;
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
            Icon(Icons.person_add, size: 30),
            Icon(Icons.library_books, size: 30),
            Icon(Icons.library_books, size: 30),
            Icon(Icons.add_circle, size: 30),
            Icon(Icons.add_circle, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.redAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Colors.redAccent,
          child: Center(
            child: _showPage,
          ),
        ));
  }
}
