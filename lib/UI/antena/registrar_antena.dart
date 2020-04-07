import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/antena_bloc.dart';
import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/estado_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';
import 'package:tenic_api/resource/constants.dart';

class RegistrarAntena extends StatefulWidget {
  @override
  RegistrarAntenaState createState() => RegistrarAntenaState();
}

class RegistrarAntenaState extends State<RegistrarAntena> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AntenaBloc antenaBloc;
  Antena _antena = Antena(
    nombre: '',
    referencia: '',
    altura: '',
    orientacion: '',
    inclinacion: '',
    torre: Torre(idTorre: 0),
    state: Estado(id: 0)

  );


  @override
  void initState() {
    super.initState();
    antenaBloc = AntenaBloc(context);
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
      antenaBloc.createAntena(_antena);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.tittleAntena),
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: Image(
          image: AssetImage(Constants.registroImage),
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.difference,
          color: Colors.black12,
          ),
        ),
        Center(
          child: Container(
            child: Theme(
              data: ThemeData(
                  brightness: Brightness.light,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.black, fontSize: 18.0),
                  )),
              isMaterialAppTheme: true,
              child: SingleChildScrollView(
                child: SafeArea(
                  top: false,
                  bottom: false,
                  child: Form(
                    key: _formKey,
                    autovalidate: _autovalidate,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                          ),

                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelNombre,
                            ),
                            validator: validateName,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              _antena.nombre = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelReferencia,
                            ),
                            keyboardType: TextInputType.number,
                            validator: validateReferencia,
                            onSaved: (String value) {
                              _antena.referencia = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelAltura,
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            validator: validateAltura,
                            onSaved: (String value) {
                              _antena.altura = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            obscureText: true,
                            autocorrect: false,
                            decoration: new InputDecoration(
                              labelText: Constants.labelOrientacion,
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            validator: validateGrados,
                            onSaved: (String value) {
                              _antena.orientacion = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelInclinacion,
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            validator: validateGrados,
                            onSaved: (String value) {
                              _antena.inclinacion = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),

                          /*TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelTorre,
                            ),
                            keyboardType: TextInputType.text,
                            maxLength: 12,
                            validator: validateName,
                            onSaved: (String value) {
                              //_antena.torre = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),*/

                          TextFormField(
                            decoration: new InputDecoration(
                              //labelText: Constants.tipoUsuario,
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            onSaved: (String tow) {
                              _antena.torre.idTorre = int.parse(tow);
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),

                          TextFormField(
                            decoration: new InputDecoration(
                              //labelText: Constants.tipoUsuario,
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            onSaved: (String sta) {
                              _antena.state.id = int.parse(sta);
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.only(top: 60.0),
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            height: 50.0,
                            minWidth: 150.0,
                            color: Color(0xFFE1F5FE),
                            splashColor: Colors.blueAccent,
                            textColor: Colors.black,
                            child: Text(Constants.btnRegistar),
                            onPressed: _handleSubmitted,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }


  String validateName(String value) {
    String pattern = Constants.patternNombre;
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return Constants.validateName;
    } else if (!regExp.hasMatch(value)) {
      return Constants.nameStructure;
    }
    return null;
  }
  String validateReferencia(String value) {
    if (value.length == 0) {
      return Constants.validateReferencia;
    } else if (value.length != 10) {
      return Constants.referenciaStructure;
    }
    return null;
  }
    String validateAltura(String value) {
    if (value.length == 0) {
      return Constants.validateAltura;
    } else if (value.length != 2) {
      return Constants.alturaStructure;
    }
    return null;
  }
    String validateGrados(String value) {
    if (value.length == 0) {
      return Constants.validateOrientacion;
    } else if (value.length != 3) {
      return Constants.orientacionStructure;
    }
    return null;
  }
}