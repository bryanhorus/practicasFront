import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/usuario_bloc.dart';
import 'package:tenic_api/modelo/tipo_usuario_model.dart';
import 'package:tenic_api/modelo/usuario_model.dart';
import 'package:tenic_api/resource/constants.dart';

class TextFormFieldDemo extends StatefulWidget {
  const TextFormFieldDemo({Key key}) : super(key: key);

  @override
  TextFormFieldDemoState createState() => TextFormFieldDemoState();
}

final String data =
    '[{"idTipo": 1, "descripcion": "ADMIN"}, {"idTipo": 2, "descripcion": "TECNICO"}]';
List<Role> _rol = [];
int selectedRol;

class TextFormFieldDemoState extends State<TextFormFieldDemo>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autovalidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UsuarioBloc userBloc = UsuarioBloc();
  Usuario _tecnico = Usuario(
      nombre: '',
      apellido: '',
      correo: '',
      password: '',
      telfono: '',
      roles: List());

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
            content: Text(Constants.registroExitoso),
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
                onPressed: () {},
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
      userBloc.createUsuario(_tecnico);
      showRegisterDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final json = JsonDecoder().convert(data);
    _rol = (json).map<Role>((item) => Role.fromJson(item)).toList();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text(Constants.tittleRegistroUsuario)),
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
                                icon: Icon(Icons.account_circle)),
                            validator: validateName,
                            textCapitalization: TextCapitalization.sentences,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              _tecnico.nombre = value.trim();
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelApellido,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelApellido,
                                icon: Icon(Icons.account_circle)),
                            textCapitalization: TextCapitalization.sentences,
                            keyboardType: TextInputType.text,
                            validator: validateName,
                            onSaved: (String value) {
                              _tecnico.apellido = value.trim();
                            },
                            style: TextStyle(fontSize: 18.0),
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
                              _tecnico.correo = value.trim();
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            obscureText: true,
                            autocorrect: false,
                            decoration: InputDecoration(
                                labelText: Constants.labelPassword,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelPassword,
                                icon: Icon(Icons.security)),
                            maxLength: 12,
                            validator: validatePassword,
                            onSaved: (String value) {
                              _tecnico.password = value.trim();
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
                              _tecnico.telfono = value.trim();
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              hint: Text("Rol"),
                              value: selectedRol,
                              isDense: true,
                              onChanged: (int newValue) {
                                setState(() {
                                  selectedRol = newValue;
                                });
                                _tecnico.roles.add(Role(idTipo: newValue));
                                print(selectedRol);
                              },
                              items: _rol.map((Role map) {
                                return DropdownMenuItem<int>(
                                  value: map.idTipo,
                                  child: Text(map.descripcion,
                                      style: TextStyle(color: Colors.black)),
                                );
                              }).toList(),
                            ),
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
