import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/usuario_bloc.dart';
import 'package:tenic_api/modelo/tipo_usuario_model.dart';
import 'package:tenic_api/modelo/usuario_model.dart';
import 'package:tenic_api/resource/constants.dart';
import 'package:tenic_api/navigator.dart';

class ActualizarUsuario extends StatefulWidget {

  final Usuario usuario;
  const ActualizarUsuario({this.usuario,Key key}) : super(key: key);

  @override
  ActualizarUsuarioState createState() => ActualizarUsuarioState( usuario: usuario);
}

class ActualizarUsuarioState extends State<ActualizarUsuario>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ActualizarUsuarioState ({this.usuario});
  UsuarioBloc userBloc;

  Usuario usuario = Usuario(
      nombre: "",
      apellido: "",
      correo: "",
      password: "",
      telfono: "",
      role: Role(idTipo: 0)
  );

  @override
  void initState() {
    super.initState();
    userBloc = UsuarioBloc(context);
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  bool _autovalidate = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
    } else {
      form.save();
      userBloc.updateUsuario(usuario);
    }
    TecniNavigator.goToHomeCoordinador(context);
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
                            decoration: new InputDecoration(
                              labelText: Constants.labelNombre,
                            ),
                            initialValue: usuario.nombre,
                            validator: validateName,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (String value) {
                              usuario.nombre = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelApellido,
                            ),
                            initialValue: usuario.apellido,
                            validator: validateName,
                            onSaved: (String value) {
                              usuario.apellido = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelCorreo,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            maxLength: 32,
                            initialValue: usuario.correo,
                            validator: validateEmail,
                            onSaved: (String value) {
                              usuario.correo = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            obscureText: true,
                            autocorrect: false,
                            decoration: new InputDecoration(
                              labelText: Constants.labelPassword,
                            ),
                            maxLength: 12,
                            initialValue: usuario.password,
                            validator: validatePassword,
                            onSaved: (String value) {
                              usuario.password = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelTelefono,
                            ),
                            keyboardType: TextInputType.phone,
                            maxLength: 12,
                            initialValue: usuario.telfono,
                            validator: validateMobile,
                            onSaved: (String value) {
                              usuario.telfono = value;
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
                            color: Color(0XFF03A9F4),
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
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return Constants.validateName;
    } else if (!regExp.hasMatch(value)) {
      return Constants.nameStructure;
    }
    return null;
  }

  String validateLastName(String value) {
    String pattern = Constants.patternNombre;
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return Constants.validateLastName;
    } else if (!regExp.hasMatch(value)) {
      return Constants.lastNameStructure;
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern = Constants.pattern;
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
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
    if (value.length == 0) {
      return Constants.validateMobile;
    } else if (value.length != 10) {
      return Constants.mobileStructure;
    }
    return null;
  }
}