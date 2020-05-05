import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/torre_bloc.dart';
import 'package:tenic_api/modelo/departamento_model.dart';
import 'package:tenic_api/modelo/municipio_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';
import 'package:tenic_api/resource/constants.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class Mapa extends StatefulWidget {
  final Torre torre;
  const Mapa({this.torre,Key key}) : super(key: key);

  @override
  CrearTorreState createState() => CrearTorreState(torre: torre);
}

class CrearTorreState extends State<Mapa>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  CrearTorreState({this.torre});

  final TorreBloc torreBloc = TorreBloc();
  Torre torre = Torre(
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
    super.initState();
    TorreBloc();
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text(Constants.tittleMapaTorre)),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        FlutterMap(options: MapOptions(minZoom: 10.0, zoom: 17.0 ,center: LatLng(3.3836576,-76.5480667)),layers: [ TileLayerOptions(urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',subdomains: ['a','b','c']),MarkerLayerOptions(markers: [Marker(width: 45.0,height: 45.0,point:LatLng(3.3836576,-76.5480667),builder: (context)=>Container(
          child: IconButton(icon: Icon(Icons.add_location), iconSize: 40.0, color: Colors.red, onPressed: () {print('Marker tapped!');}),
        ))])])
      ]),
    );
  }

}