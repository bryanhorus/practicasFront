import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/observation_bloc.dart';
import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/observacion_model.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/resource/constants.dart';

class ObservationDetail extends StatefulWidget {
  final Observacion observation;
    const ObservationDetail({this.observation, Key key}) : super(key: key);

  @override
  ActualizarObsState createState() =>
      ActualizarObsState(observacion: observation);
}

class ActualizarObsState extends State<ObservationDetail>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autovalidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ActualizarObsState({this.observacion});
  final ObservationBloc obsBloc = ObservationBloc();

  Observacion observacion = Observacion(

    fecha: "",
    orientacion: "",
    inclinacion: "",
    antena: Antena(idAntena: 0));

    @override
  void initState() {
    super.initState();
    ObservationBloc();
  
  }
    /*showUpdateDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title:
                Row(children: [Icon(Icons.info), Text(Constants.tittleDialog)]),
            //content: Text(Constants.actualizacion),
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
                  TecniNavigator.goToListaAntena(context);//
                },
              )
            ],
          );
        });
  }*/

  /*void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
    } else {
      form.save();
      antenaBloc.updateAntena(antena);
      showUpdateDialog(context);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.tittleObsDetail),
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
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: Constants.labelDate,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              hintText: Constants.labelDate,
                            ),
                            initialValue: observacion.fecha,
                            //validator: validateName,
                            //keyboardType: TextInputType.text,
                            /*onSaved: (String value) {
                              antena.nombre = value.trim();
                            },*/
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: Constants.labelOrientacion,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              hintText: Constants.labelOrientacion,
                            ),
                            initialValue: observacion.orientacion,
                            //keyboardType: TextInputType.number,
                            /*validator: validateNumeros,
                            onSaved: (String value) {
                              antena.referencia = value.trim();
                            },*/
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: Constants.labelInclinacion,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              hintText: Constants.labelInclinacion,
                            ),
                            //keyboardType: TextInputType.number,
                            //maxLength: 4,
                            initialValue: observacion.inclinacion,
                            /*validator: validateNumeros,
                            onSaved: (String value) {
                              antena.altura = value.trim();
                            },*/
                            style: TextStyle(fontSize: 18.0),
                          ),
                     
                          /*TextFormField(
                            decoration: InputDecoration(
                              labelText: Constants.labelInclinacion,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              hintText: Constants.labelInclinacion,
                            ),
                            initialValue: antena.inclinacion,
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            validator: validateNumeros,
                            onSaved: (String value) {
                              antena.inclinacion = value.trim();
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),*/
                          
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                          ),
                          /*MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            height: 50.0,
                            minWidth: 150.0,
                            color: Color(0xFF42a5f5),
                            splashColor: Colors.blue,
                            textColor: Colors.black,
                            child: Text(Constants.btnModificar),
                            //onPressed: _handleSubmitted,
                          ),*/
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

  /*String validateName(String value) {
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
  }*/
}
