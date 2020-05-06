
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/usuario_bloc.dart';
import 'package:tenic_api/modelo/recuperar.dart';
import 'package:tenic_api/modelo/usuario_model.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/resource/constants.dart';

class RecuperarContrasena extends StatefulWidget {
  const RecuperarContrasena({Key key}) : super(key: key);

  @override
  RecuperarContrasenaState createState() => RecuperarContrasenaState();
}

class RecuperarContrasenaState extends State<RecuperarContrasena>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autovalidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UsuarioBloc userBloc = UsuarioBloc();
  Recuperar _recuperar = Recuperar(
      correo: '',
      telefono: '',
);

  @override
  void initState() {
    super.initState();
    UsuarioBloc();
  }

  showRegisterDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title:
                Row(children: [Icon(Icons.info), Text(Constants.tittleDialog)]),
            content: Text("¡Correo Enviado Correctamente!"),
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
                onPressed: () {TecniNavigator.goToHome(context);},
              )
            ],
          );
        });
  }

    void _olvidarContrasena() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
    } else {
      form.save();
      userBloc.updateContrasena(_recuperar);
      showRegisterDialog(context);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text("Recuperar Contraseña")),
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
                                labelText: Constants.labelCorreo,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelCorreo,
                                icon: Icon(Icons.email)),
                            keyboardType: TextInputType.emailAddress,
                            maxLength: 32,
                            validator: validateEmail,
                            onSaved: (String value) {
                              _recuperar.correo = value.trim();
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelTelefono,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelTelefono,
                                icon: Icon(Icons.phone)),
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            validator: validateMobile,
                            onSaved: (String value) {
                              _recuperar.telefono = value.trim();
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
                            child: Text("Enviar"),
                            onPressed: _olvidarContrasena,
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

  String validateMobile(String value) {
    String patttern = Constants.patterTelefono;
    RegExp regExp = RegExp(patttern);
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
