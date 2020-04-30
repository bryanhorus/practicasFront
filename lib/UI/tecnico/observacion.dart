import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/antena_bloc.dart';
import 'package:tenic_api/bloc/observacion_bloc.dart';
import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/departamento_model.dart';
import 'package:tenic_api/modelo/estado_model.dart';
import 'package:tenic_api/modelo/municipio_model.dart';
import 'package:tenic_api/modelo/observacion_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';
import 'package:tenic_api/navigator_tecnico.dart';
import 'package:tenic_api/resource/constants.dart';

class CrearObservacion extends StatefulWidget {
  const CrearObservacion({Key key}) : super(key: key);

  @override
  CrearObservacionState createState() => CrearObservacionState();
}

class CrearObservacionState extends State<CrearObservacion>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _inputDate = TextEditingController();

  final AntenaBloc antenaBloc = AntenaBloc();
  List<Antena> listaAntena = List();
  int currentAntena;

  final ObservacionBloc observacionBloc = ObservacionBloc();
  Observacion _observacion = Observacion(
      fecha: '',
      orientacion: '',
      inclinacion: '',
      antena: Antena(
          idAntena: 0,
          state: Estado(id: 0),
          torre: Torre(
              idTorre: 0,
              municipio: Municipio(
                  idMunicipio: 0, departament: Departamento(idDpto: 0)))));
  @override
  void initState() {
    AntenaBloc();
    antenaBloc.listarAntena().then((apiResponse) {
      setState(() {
        listaAntena = apiResponse.listAntena;
      });
    });
    super.initState();
    ObservacionBloc();
  }

  bool _autovalidate = false;

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2099),
    );
    if (picked != null) {
      setState(() {
        _observacion.fecha = picked.toIso8601String() + "Z";
        _inputDate.text = _observacion.fecha;
      });
    }
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
                  TecnicoNavigator.goToRegistrarObservacion(context);
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
      observacionBloc.createObservacion(_observacion);
      showRegisterDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text(Constants.tittleObservacion)),
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
                          TextField(
                              enableInteractiveSelection: false,
                              controller: _inputDate,
                              decoration: InputDecoration(
                                  hintText: "Fecha",
                                  labelText: "Fecha",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  suffix: Icon(Icons.create),
                                  icon: Icon(Icons.calendar_today)),
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                _selectDate(context);
                              }),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelOrientacion,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelOrientacion,
                                icon: Icon(Icons.brightness_4)),
                            keyboardType: TextInputType.number,
                            validator: validateNumeros,
                            maxLength: 3,
                            onSaved: (String value) {
                              _observacion.orientacion = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelInclinacion,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelInclinacion,
                                icon: Icon(Icons.brightness_1)),
                            keyboardType: TextInputType.number,
                            validator: validateNumeros,
                            maxLength: 3,
                            onSaved: (String value) {
                              _observacion.inclinacion = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              hint: Text("Seleccionar"),
                              value: currentAntena,
                              isDense: true,
                              onChanged: (int newValue) {
                                currentAntena = newValue;
                                setState(() {
                                  currentAntena = newValue;
                                });
                                print(currentAntena);
                                _observacion.antena.idAntena = newValue;
                              },
                              items: listaAntena.map((Antena map) {
                                return DropdownMenuItem<int>(
                                  value: map.idAntena,
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
