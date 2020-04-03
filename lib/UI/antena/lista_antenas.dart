import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/antena_bloc.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/resource/constants.dart';

class ListaAntenas extends StatefulWidget {
  @override
  ListaAntenasState createState() => ListaAntenasState();
}

class ListaAntenasState extends State<ListaAntenas>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AntenaBloc antenaBloc;
  ApiResponse apiResponse;

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  final List<String> nombres = [];
  final List<String> ciudad = [];
  //List<> listDepartamento = List();

  _handleSubmitted() {
  
  }

  @override
  void initState() {

    _handleSubmitted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text(Constants.tittleListaAntenas)),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(),
      ]),
    );
  }
}
