import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/torre_bloc.dart';
import 'package:tenic_api/modelo/departamento_model.dart';
import 'package:tenic_api/modelo/municipio_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/resource/constants.dart';

class ActualizarTorre extends StatefulWidget {
  final Torre torre;
  const ActualizarTorre({this.torre, Key key}) : super(key: key);

  @override
  ActualizarTorreState createState() => ActualizarTorreState(torre: torre);
}

class ActualizarTorreState extends State<ActualizarTorre>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autovalidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ActualizarTorreState({this.torre});
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

  showUpdateDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title:
                Row(children: [Icon(Icons.info), Text(Constants.tittleDialog)]),
            content: Text(Constants.actualizacion),
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
                  TecniNavigator.goToListaTorre(context);
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
      torreBloc.updateTorre(torre);
      showUpdateDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text(Constants.tittleTorreactualizar)),
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
                                icon: Icon(Icons.settings_input_antenna)),
                            initialValue: torre.nombre,
                            validator: validateName,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              torre.nombre = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelIdentificacion,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelIdentificacion,
                                icon: Icon(Icons.perm_identity)),
                            initialValue: torre.identificacion,
                            keyboardType: TextInputType.number,
                            validator: validateNumeros,
                            maxLength: 10,
                            onSaved: (String value) {
                              torre.identificacion = value;
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
                            initialValue: torre.altura,
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            validator: validateNumeros,
                            onSaved: (String value) {
                              torre.altura = value;
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
    } else if (!regExp.hasMatch(value)){
      return Constants.estructura;
    }
    return null;
  }
}
