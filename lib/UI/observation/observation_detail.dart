import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/observation_bloc.dart';
import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/observacion_model.dart';
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Detalles"),
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
                            initialValue: observacion.inclinacion,
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
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

}
