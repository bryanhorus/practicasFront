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

class TextFormFieldDemoState extends State<TextFormFieldDemo>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  UsuarioBloc userBloc;
  Usuario _tecnico = Usuario(
      nombre: '',
      apellido: '',
      correo: '',
      password: '',
      telefono: '',
      tipoUsuario: TipoUsuario(idTipo: 2) 
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
      userBloc.createUsuario(_tecnico);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text(Constants.tittleRegistroUsuario)),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: Image(
              image: AssetImage(Constants.registroImage),
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.difference,
              color: Colors.black12),
        ),
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
                            decoration: new InputDecoration(
                              labelText: Constants.labelNombre,
                            ),
                            validator: validateName,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (String value) {
                              _tecnico.nombre = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelApellido,
                            ),
                            validator: validateName,
                            onSaved: (String value) {
                              _tecnico.apellido = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelCorreo,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            maxLength: 32,
                            validator: validateEmail,
                            onSaved: (String value) {
                              _tecnico.correo = value;
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
                            validator: validatePassword,
                            onSaved: (String value) {
                              _tecnico.password = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelTelefono,
                            ),
                            keyboardType: TextInputType.phone,
                            maxLength: 12,
                            validator: validateMobile,
                            onSaved: (String value) {
                              _tecnico.telefono = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          /*
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.tipoUsuario,
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            onSaved: (String value ) {
                              _tecnico.tipoUsuario = int.parse(value);
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),*/
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
                            color: Color(0xFFE1F5FE),
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
