

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/usuario_bloc.dart';
import 'package:tenic_api/modelo/tipo_usuario_model.dart';
import 'package:tenic_api/modelo/usuario_model.dart';
import 'package:tenic_api/resource/constants.dart';

import '../../navigator.dart';
import '../dialog.dart';

class EditarPerfil extends StatefulWidget {
  final Usuario usuario;
  const EditarPerfil({this.usuario, Key key}) : super(key: key);

  @override
  EditarPerfilState createState() =>
      EditarPerfilState(usuario: usuario);
}

class EditarPerfilState extends State<EditarPerfil>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autovalidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  EditarPerfilState({this.usuario});
  final UsuarioBloc userBloc = UsuarioBloc();

  Usuario usuario = Usuario(
      nombre: "daniel",
      apellido: "ayala",
      correo: "trujillo",
      telfono: "123445",
      roles: [Role(idTipo: 0)]);

  @override
  void initState() {
    super.initState();
    UsuarioBloc();
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
                  TecniNavigator.goToListaUsuarios(context);
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
      userBloc.updateUsuario(usuario);
      showUpdateDialog(context);
    }
    Message().showUpdateDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text(Constants.tittleActualizar)),
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
                          TextFormField(
                            decoration:  InputDecoration(
                                labelText: Constants.labelNombre,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelNombre,
                                icon: Icon(Icons.account_circle)),
                            textCapitalization: TextCapitalization.sentences,
                            initialValue: usuario.nombre,
                            validator: validateName,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              usuario.nombre = value.trim();
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration:  InputDecoration(
                                labelText: Constants.labelApellido,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelApellido,
                                icon: Icon(Icons.account_circle)),
                            initialValue: usuario.apellido,
                            textCapitalization: TextCapitalization.sentences,
                            validator: validateName,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              usuario.apellido = value.trim();
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration:  InputDecoration(
                                labelText: Constants.labelCorreo,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelCorreo,
                                icon: Icon(Icons.email)),
                            keyboardType: TextInputType.emailAddress,
                            maxLength: 32,
                            initialValue: usuario.correo,
                            validator: validateEmail,
                            onSaved: (String value) {
                              usuario.correo = value.trim();
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            decoration:  InputDecoration(
                                labelText: Constants.labelTelefono,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelTelefono,
                                icon: Icon(Icons.phone)),
                            keyboardType: TextInputType.phone,
                            maxLength: 12,
                            initialValue: usuario.telfono,
                            validator: validateMobile,
                            onSaved: (String value) {
                              usuario.telfono = value.trim();
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
                            textColor: Colors.white,
                            child: Text(Constants.btnModificar),
                            onPressed: _handleSubmitted,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
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

  String validateLastName(String value) {
    String pattern = Constants.patternNombre;
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return Constants.validateLastName;
    } else if (!regExp.hasMatch(value)) {
      return Constants.lastNameStructure;
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern = Constants.pattern;
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return Constants.validateEmail;
    } else if (!regExp.hasMatch(value)) {
      return Constants.emailStructure;
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return Constants.validatePassword;
    } else if (value.length < 8) {
      return Constants.passwordStructure;
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = Constants.patterTelefono;
    RegExp regExp =  RegExp(patttern);
    if (value.isEmpty) {
      return Constants.validateMobile;
    } else if (value.length != 10) {
      return Constants.mobileStructure;
    } else if (!regExp.hasMatch(value)) {
      return Constants.estructura;
    }
    return null;
  }
}