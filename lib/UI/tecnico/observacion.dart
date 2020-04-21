import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/UI/dialog.dart';
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

  //final ObservacionBloc observacionBloc = ObservacionBloc();
  Observacion _observacion = Observacion(
      fecha: '',
      orientacion: '',
      inclinacion: '',
      antena:
          Antena(idAntena: 0, torre: Torre(idTorre: 0), state: Estado(id: 0)));
  @override
  void initState() {
    super.initState();
    //ObservacionBloc();
  }

  bool _autovalidate = false;

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
    } else {
      form.save();
      //observacionBloc.createTorre(_observacion);
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
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Fecha",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: "Fecha",
                                icon: Icon(Icons.date_range)),
                            validator: validateName,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              _observacion.fecha = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelOrientacion,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelOrientacion,
                                icon: Icon(Icons.perm_identity)),
                            keyboardType: TextInputType.number,
                            maxLength: 2,
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
                                icon: Icon(Icons.directions)),
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
                                icon: Icon(Icons.image)),
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            onSaved: (String antena) {
                              _observacion.antena.idAntena = int.parse(antena);
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
