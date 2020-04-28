import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/UI/dialog.dart';
import 'package:tenic_api/bloc/municipio_bloc.dart';
import 'package:tenic_api/bloc/torre_bloc.dart';
import 'package:tenic_api/modelo/departamento_model.dart';
import 'package:tenic_api/modelo/municipio_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';
import 'package:tenic_api/resource/constants.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class Mapa extends StatefulWidget {
  const Mapa({Key key}) : super(key: key);

  @override
  CrearTorreState createState() => CrearTorreState();
}

class CrearTorreState extends State<Mapa>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final MunicipioBloc municipioBloc = MunicipioBloc();
  List<Municipio> listaMunicipio = List();
  int currentMunicipio;

  final TorreBloc torreBloc = TorreBloc();
  Torre _torre = Torre(
      nombre: '',
      identificacion: '',
      direccion: '',
      coordenadas: '',
      altura: '',
      tecnologia: '',
      municipio:
          Municipio(idMunicipio: 0, departament: Departamento(idDpto: 0)));

  @override
  void initState() {
    MunicipioBloc();
    municipioBloc.listarMunicipio().then((apiResponse) {
      setState(() {
        listaMunicipio = apiResponse.listMunicipio;
      });
    });
    super.initState();
    TorreBloc();
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  bool _autovalidate = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
    } else {
      form.save();
      torreBloc.createTorre(_torre);
      Message().showRegisterDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text(Constants.tittleMapaTorre)),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        FlutterMap(options: MapOptions(minZoom: 10.0,center: LatLng(3.260521, -76.536882)),layers: [ TileLayerOptions(urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',subdomains: ['a','b','c']),MarkerLayerOptions(markers: [Marker(width: 45.0,height: 45.0,point:LatLng(3.260521, -76.536882),builder: (context)=>Container(
          child: IconButton(icon: Icon(Icons.add_location), onPressed: () {print('Marker tapped!');}),
        ))])])
      ]),
    );
  }

}