import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/UI/dialog.dart';
import 'package:tenic_api/bloc/antena_bloc.dart';
import 'package:tenic_api/bloc/torre_bloc.dart';
import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/departamento_model.dart';
import 'package:tenic_api/modelo/estado_model.dart';
import 'package:tenic_api/modelo/municipio_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';
import 'package:tenic_api/resource/constants.dart';

class RegistrarAntena extends StatefulWidget {
  @override
  RegistrarAntenaState createState() => RegistrarAntenaState();
}

class RegistrarAntenaState extends State<RegistrarAntena>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TorreBloc torreBloc = TorreBloc();
  List<Torre> listaTorre = List();
  int currentTorre;


  final AntenaBloc antenaBloc = AntenaBloc();
  Antena _antena = Antena(
      nombre: '',
      referencia: '',
      altura: '',
      orientacion: '',
      inclinacion: '',
      state: Estado(id: 0),
      torre: Torre(
          idTorre: 0,
          municipio:
              Municipio(idMunicipio: 0, departament: Departamento(idDpto: 0))));

  @override
  void initState() {

    TorreBloc();
    torreBloc.listarTorre().then((apiResponse) {
      setState(() {
        listaTorre = apiResponse.listTorre;
      });
    });
    super.initState();
    AntenaBloc();
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
      Message().showRegisterDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    currentTorre = listaTorre[0].idTorre;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.tittleAntena),
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
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
                            decoration: InputDecoration(
                                labelText: Constants.labelNombre,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelNombre,
                                icon: Icon(Icons.account_circle)),
                            validator: validateName,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              _antena.nombre = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelReferencia,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelReferencia,
                                icon: Icon(Icons.receipt)),
                            keyboardType: TextInputType.number,
                            validator: validateReferencia,
                            onSaved: (String value) {
                              _antena.referencia = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelAltura,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelAltura,
                                icon: Icon(Icons.show_chart)),
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            validator: validateAltura,
                            onSaved: (String value) {
                              _antena.altura = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelOrientacion,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelOrientacion,
                                icon: Icon(Icons.call_missed_outgoing)),
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            validator: validateGrados,
                            onSaved: (String value) {
                              _antena.orientacion = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelInclinacion,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelInclinacion,
                                icon: Icon(Icons.call_split)),
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            validator: validateGrados,
                            onSaved: (String value) {
                              _antena.inclinacion = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: ('estado'),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelestado,
                                icon: Icon(Icons.graphic_eq)),
                            keyboardType: TextInputType.number,
                            maxLength: 12,
                            onSaved: (String value) {
                              _antena.state.id = int.parse(value);
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),

                          TextFormField(
                            decoration: InputDecoration(
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
                            decoration: InputDecoration(
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
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          DropdownButtonHideUnderline(
                            child:  DropdownButton<int>(
                              hint: Text(listaTorre[0].nombre),
                              value: currentTorre,
                              isDense: true,
                              onChanged: (int newValue) {
                                currentTorre = newValue;
                                setState(() {
                                  currentTorre = newValue;
                                });
                                print(currentTorre);
                                _antena.torre.idTorre = newValue;
                              },
                              items: listaTorre.map((Torre map) {
                                return  DropdownMenuItem<int>(
                                  value: map.idTorre,
                                  child:  Text(map.nombre,
                                      style:  TextStyle(color: Colors.black)),
                                );
                              }).toList(),
                            ),
                          ),
                          
                          
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            height: 50.0,
                            minWidth: 150.0,
                            color: Color(0xFF42a5f5),
                            splashColor: Colors.blue,
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
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return Constants.validateName;
    } else if (!regExp.hasMatch(value)) {
      return Constants.nameStructure;
    }
    return null;
  }

  String validateReferencia(String value) {
    if (value.isEmpty) {
      return Constants.validateReferencia;
    } else if (value.length != 10) {
      return Constants.referenciaStructure;
    }
    return null;
  }

  String validateAltura(String value) {
    if (value.isEmpty) {
      return Constants.validateAltura;
    } else if (value.length != 2) {
      return Constants.alturaStructure;
    }
    return null;
  }

  String validateGrados(String value) {
    if (value.isEmpty) {
      return Constants.validateOrientacion;
    } else if (value.length != 3) {
      return Constants.orientacionStructure;
    }
    return null;
  }
}
