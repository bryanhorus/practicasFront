import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/antena_bloc.dart';
import 'package:tenic_api/bloc/observacion_bloc.dart';
import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/observacion_model.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/resource/constants.dart';

class BuscarObservacionPage extends StatefulWidget {
  const BuscarObservacionPage({Key key}) : super(key: key);

  @override
  BuscarObservacionPageState createState() => BuscarObservacionPageState();
}

class BuscarObservacionPageState extends State<BuscarObservacionPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;
  final AntenaBloc antenaBloc = AntenaBloc();
  List<Antena> listAntena = List();
  ObservacionBloc observacionBloc = ObservacionBloc();
  Observacion observacion= Observacion(antena: Antena(idAntena: 0));
  int currenAntena;
  @override
  void initState() {
    AntenaBloc();
    antenaBloc.listarAntena().then((apiresponse) {
      setState(() {
        listAntena = apiresponse.listAntena;
      });
    });
    super.initState();
  }

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
    } else {
      form.save();
      observacionBloc.buscarObservacion(observacion);
      TecniNavigator.goToListaBusqueda(context);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text("Buscar")),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Center(
          child: Container(
            child: Theme(
              data: ThemeData(
                  brightness: Brightness.light,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.black, fontSize: 10.0),
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
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Center(
                            child: Card(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                  const ListTile(
                                    leading: Icon(Icons.album),
                                    title: Text('Selecciona'),
                                    subtitle: Text(
                                        'Una antena para buscar las observaciones que tiene.'),
                                  )
                                ])),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              hint: Text("Antena"),
                              value: currenAntena,
                              isDense: true,
                              onChanged: (int newValue) {
                                currenAntena = newValue;
                                setState(() {
                                  currenAntena = newValue;
                                });
                                print(currenAntena);
                                observacion.antena.idAntena = newValue;
                              },
                              
                              items: listAntena.map((Antena map) {
                                return DropdownMenuItem<int>(
                                  value: map.idAntena,
                                  child: Text(map.nombre,
                                      style: TextStyle(color: Colors.black)),
                                );
                              }).toList(),
                            ),
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
                            splashColor: Colors.blue,
                            textColor: Colors.black,
                            child: Text(Constants.btnSiguiente),
                            onPressed: (){TecniNavigator.goToListaBusqueda(context);},
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
