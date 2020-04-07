import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/torre_bloc.dart';
import 'package:tenic_api/modelo/municipio_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';
import 'package:tenic_api/resource/constants.dart';

import '../../navigator.dart';

class ActualizarTorre extends StatefulWidget {

  final Torre torre;
  const ActualizarTorre({this.torre, Key key}) : super(key: key);

  @override
  ActualizarTorreState createState() => ActualizarTorreState(torre: torre);
}

class ActualizarTorreState extends State<ActualizarTorre>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ActualizarTorreState({this.torre});
  TorreBloc torreBLoC;

  Torre torre = Torre(
    nombre: "",
    identificacion: "",
    direccion: "",
    coordenadas: "",
    altura: "",
    tecnologia: "",
    municipio: Municipio(idMunicipio: 0)//id


  );


  @override
  void initState() {
    super.initState();
    torreBLoC = TorreBloc(context);

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
      torreBLoC.updateTorre(torre);
    }
    //TecniNavigator.goTocord(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text(Constants.tittleTorreactualizar)),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: Image(
            image: AssetImage(Constants.registroImage),
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.difference,
            color: Colors.black12,
          ),
        ),
      ]),
    );
  }

  

}