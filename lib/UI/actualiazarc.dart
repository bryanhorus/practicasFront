import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/inicio_sesion_bloc.dart';
import 'package:tenic_api/bloc/usuario_bloc.dart';
import 'package:tenic_api/modelo/crear_contrasena.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/repository/repository.dart';
import 'package:tenic_api/resource/constants.dart';

class Actualizar extends StatefulWidget {
  const Actualizar({Key key}) : super(key: key);

  @override
  ActualizarState createState() => ActualizarState();
}

class ActualizarState extends State<Actualizar>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autovalidate = false;
  UsuarioBloc usuarioBloc = UsuarioBloc();
  InicioSesionBloc inicioSesionBloc = InicioSesionBloc();
      Repository _repository = Repository();
  String id = "";

    Contrasena _tecnico = Contrasena(
      id: 0 ,
      newPassword: '',
);

  @override
  void initState() {
    super.initState();
    traer();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                onPressed: _cerrar,
              )
            ],
          );
        });
  }

  void _cerrar() async {

    await inicioSesionBloc.cerrarSesion();
    TecniNavigator.goToHome(context);
    print("Stefi" + id);
  }

  void traer() async {

    id = await _repository.getLocalId();
    print("Stefi" + id);
  }

  void _handleSubmitted(){

    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
    } else {
      form.save();
      usuarioBloc.updateContrasenaa(_tecnico);
      showUpdateDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text(Constants.titleActu)),
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
                            padding: const EdgeInsets.only(top: 18.0),
                          ),
                          TextFormField(
                            obscureText: true,
                            autocorrect: false,
                            decoration: InputDecoration(
                                labelText: Constants.labelPassword3,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelPassword3,
                                icon: Icon(Icons.security)),
                            maxLength: 12,
                            validator: validatePassword,
                            onSaved: (String value) {
                              _tecnico.newPassword = value.trim();
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                                labelText: id,
                                hintText: "",
                                ),
                                initialValue: id,
                            onSaved: (String value) {
                              _tecnico.id = int.parse(id);
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
                            splashColor: Colors.blue,
                            textColor: Colors.white,
                            child: Text(Constants.btnCambiar2),
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

  String validatePassword(String value) {
    if (value.isEmpty) {
      return Constants.validatePassword;
    } else if (value.length < 8) {
      return Constants.passwordStructure;
    }
    return null;
  }
}
