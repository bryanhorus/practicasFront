import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/antena_bloc.dart';
import 'package:tenic_api/bloc/torre_bloc.dart';
import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/departamento_model.dart';
import 'package:tenic_api/modelo/estado_model.dart';
import 'package:tenic_api/modelo/municipio_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/resource/constants.dart';

class RegistrarAntena extends StatefulWidget {
  @override
  RegistrarAntenaState createState() => RegistrarAntenaState();
}

class RegistrarAntenaState extends State<RegistrarAntena>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TorreBloc torreBloc = TorreBloc();
    bool _autovalidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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

  showRegisterDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title:
                Row(children: [Icon(Icons.info), Text(Constants.tittleDialog)]),
            content: Text(Constants.registroExitoso),
            actions: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Text(
                  Constants.btnCerrar,
                  style: TextStyle(color: Colors.black),
                ),
                color: Color(0xFF42a5f5),
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                onPressed: () {
                  TecniNavigator.goToListaAntena(context);
                },
              )
            ],
          );
        });
  }

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
    } else {
      form.save();
      antenaBloc.createAntena(_antena);
      showRegisterDialog(context);
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
                            textCapitalization: TextCapitalization.sentences,
                            validator: validateName,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              _antena.nombre = value.trim();
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
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            validator: validateNumeros,
                            onSaved: (String value) {
                              _antena.referencia = value.trim();
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
                            validator: validateNumeros,
                            onSaved: (String value) {
                              _antena.altura = value.trim();
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
                            validator: validateNumeros,
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
                            validator: validateNumeros,
                            onSaved: (String value) {
                              _antena.inclinacion = value.trim();
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
                            validator: validateNumeros,
                            maxLength: 1,
                            onSaved: (String value) {
                              _antena.state.id = int.parse(value);
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              hint: Text("Seleccionar"),
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
                                return DropdownMenuItem<int>(
                                  value: map.idTorre,
                                  child: Text(map.nombre,
                                      style: TextStyle(color: Colors.black)),
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

  String validateNumeros(String value) {
    String pattern = Constants.patterNumero;
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return Constants.validateAltura;
    } else if (!regExp.hasMatch(value)) {
      return Constants.estructura;
    }
    return null;
  }
}
