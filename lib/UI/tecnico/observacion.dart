import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/UI/dialog.dart';
import 'package:tenic_api/bloc/observacion_bloc.dart';
import 'package:tenic_api/bloc/torre_bloc.dart';
import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/estado_model.dart';
import 'package:tenic_api/modelo/observacion_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';
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

  final TorreBloc torreBloc = TorreBloc();
  List<Torre> listaTorre = List();
  int currentTorre;

  final ObservacionBloc observacionBloc = ObservacionBloc();
  Observacion _observacion = Observacion(
      fecha: '',
      orientacion: '',
      inclinacion: '',
      antena:
          Antena(idAntena: 0, torre: Torre(idTorre: 0), state: Estado(id: 0)));
  @override
  void initState() {

    TorreBloc();
    torreBloc.listarTorre().then((apiResponse) {
      setState(() {
        listaTorre = apiResponse.listTorre;
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
      firstDate:  DateTime(2020),
      lastDate: DateTime(2099),
    );
    if (picked != null) {
      setState(() {
        //redibujar
        _observacion.fecha = picked.toIso8601String() + "Z";
        _inputDate.text = _observacion.fecha;
      });
    }
  }

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
    } else {
      form.save();
      observacionBloc.createObservacion(_observacion);
      Message().showRegisterDialog(context);
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
                          suffix: Icon(Icons.create),
                          icon: Icon(Icons.calendar_today)),
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        _selectDate(context);

                      }
                      ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelOrientacion,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelOrientacion,
                                icon: Icon(Icons.brightness_4)),
                            keyboardType: TextInputType.number,
                            //validator: validateName,
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
                            maxLength: 3,
                            onSaved: (String value) {
                              _observacion.inclinacion = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelNombreAntena,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelNombreAntena,
                                icon: Icon(Icons.settings_input_antenna)),
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            onSaved: (String antena) {
                              _observacion.antena.idAntena = int.parse(antena);
                            },
                            style: TextStyle(fontSize: 18.0),
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
