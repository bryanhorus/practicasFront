import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/antena_bloc.dart';
import 'package:tenic_api/bloc/asignar_antena.dart';
import 'package:tenic_api/bloc/usuario_bloc.dart';
import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/asignar_antena.dart';
import 'package:tenic_api/modelo/departamento_model.dart';
import 'package:tenic_api/modelo/estado_model.dart';
import 'package:tenic_api/modelo/municipio_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';
import 'package:tenic_api/modelo/usuario_model.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/resource/constants.dart';

class ActualizarAsignarAntena extends StatefulWidget {
  final AsignarAntena asignarAntena;

  const ActualizarAsignarAntena({Key key, this.asignarAntena}) : super(key: key);

  @override
  ActualizarAsignarAntenaState createState() => ActualizarAsignarAntenaState(asignarAntena: asignarAntena);
}

class ActualizarAsignarAntenaState extends State<ActualizarAsignarAntena>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autovalidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ActualizarAsignarAntenaState({this.asignarAntena});
  final UsuarioBloc usuarioBloc = UsuarioBloc();
  final AntenaBloc antenaBloc = AntenaBloc();
  List<Usuario> listUsuario = List();
  List<Antena> listAntena = List();
  AsignarAntenaBloc asignarAntenaBloc = AsignarAntenaBloc();
  AsignarAntena asignarAntena = AsignarAntena(antena: Antena(
          idAntena: 0,
          state: Estado(id: 0),
          torre: Torre(
              idTorre: 0,
              municipio: Municipio(
                  idMunicipio: 0, 
                  departament: Departamento(idDpto: 0)))),
                  usuario: Usuario(idUsuario: 0));
  @override
  void initState() {
    UsuarioBloc();
    usuarioBloc.listarUsuario().then((apiResponse) {
      setState(() {
        listUsuario = apiResponse.listUsuario;
      });
    });
    AntenaBloc();
    antenaBloc.listarAntena().then((apiresponse) {
      setState(() {
        listAntena = apiresponse.listAntena;
      });
    });
    super.initState();
    AsignarAntenaBloc();
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
                  TecniNavigator.goToListaAsignarAntena(context);
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
      asignarAntenaBloc.updateAsignarAntena(asignarAntena);
      showUpdateDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.tittleActualizarAsignarAntena),
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
                          Center(
                            child: Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    leading: Icon(Icons.album),
                                    title: Text('Selecciona'),
                                    subtitle: Text('Modifica un técnico o una antena que ya ha sido asignada.'),
                                    
                                  )])
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          const SizedBox(height: 12.0),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              hint: Text("Técnico"),
                              value: asignarAntena.usuario.idUsuario,
                              isDense: true,
                              onChanged: (int newValue) {
                                asignarAntena.usuario.idUsuario = newValue;
                                setState(() {
                                  asignarAntena.usuario.idUsuario = newValue;
                                });
                                print(asignarAntena.usuario.idUsuario);
                                asignarAntena.usuario.idUsuario = newValue;
                              },
                              items: listUsuario.map((Usuario map) {
                                return DropdownMenuItem<int>(
                                  value: map.idUsuario,
                                  child: Text(map.nombre,
                                      style: TextStyle(color: Colors.black)),
                                );
                              }).toList(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              hint: Text("Antena"),
                              value: asignarAntena.antena.idAntena,
                              isDense: true,
                              onChanged: (int newValue) {
                                asignarAntena.antena.idAntena = newValue;
                                setState(() {
                                  asignarAntena.antena.idAntena = newValue;
                                });
                                print(asignarAntena.antena.idAntena);
                                asignarAntena.antena.idAntena = newValue;
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
                            child: Text(Constants.btnModificar),
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
