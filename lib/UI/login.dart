import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/inicio_sesion_bloc.dart';
import 'package:tenic_api/modelo/LoginUser.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/navigator_tecnico.dart';
import 'package:tenic_api/repository/repository.dart';
import 'package:tenic_api/resource/constants.dart';
import 'package:tenic_api/UI/circle.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

Login _login = Login(
  correo: "",
  password: "",
);

class LoginState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autovalidate = false;
  bool _validate;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final InicioSesionBloc inicioSesionBloc = InicioSesionBloc();
  @override
  void initState() {
    super.initState();
    InicioSesionBloc();
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  void _handleSubmitted() async {
    final Repository _repository = Repository();
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
      showInSnackBar('corregir');
    } else {
      form.save();
      _validate = await inicioSesionBloc.iniciarSesion(_login);
      String rol = await _repository.getLocalRol();
      if (_validate && rol == "[ROLE_ADMIN]") {
        TecniNavigator.goToHomeCoordinador(context);
      } else if (rol == "[ROLE_TECNICO]") {
        TecnicoNavigator.goToHomeTecnico(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text(Constants.tittleLogin),
        ),
        body: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              children: <Widget>[
                Positioned(
                    right: -size.width * 0.25,
                    top: -size.width * 0.36,
                    child: Circle(
                      raidius: size.width * 0.45,
                      colors: [
                        Colors.blue,
                        Colors.yellow,
                      ],
                    )),
                //
                Positioned(
                    left: -size.width * 0.16,
                    top: -size.width * 0.39,
                    child: Circle(
                      raidius: size.width * 0.35,
                      colors: [
                        Colors.blue,
                        Colors.deepOrange,
                      ],
                    )),
                SingleChildScrollView(
                  child: SafeArea(
                      child: Container(
                          width: size.width,
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    width: 90,
                                    margin:
                                        EdgeInsets.only(top: size.width * 0.3),
                                    height: 90,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: NetworkImage(
                                              "https://as01.epimg.net/meristation/imagenes/2020/04/06/betech/1586182716_109543_1586183083_noticia_normal_recorte1.jpg"),
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 25)
                                        ]),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    'BIENVENIDO',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Center(
                                    child: SingleChildScrollView(
                                      child: SafeArea(
                                        top: false,
                                        bottom: false,
                                        child: Form(
                                          key: _formKey,
                                          autovalidate: _autovalidate,
                                          child: SingleChildScrollView(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 18.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 40.0),
                                                ),
                                                const SizedBox(height: 12.0),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        Constants.labelCorreo,
                                                    icon: Icon(Icons.mail,
                                                        color: Colors.grey),
                                                    labelText:
                                                        Constants.labelCorreo,
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.0)),
                                                  ),
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  validator: validateEmail,
                                                  controller:
                                                      _userNameController,
                                                  onSaved: (String value) {
                                                    _login.correo = value;
                                                  },
                                                  style:
                                                      TextStyle(fontSize: 18.0),
                                                ),
                                                const SizedBox(height: 12.0),
                                                TextFormField(
                                                  obscureText: true,
                                                  autocorrect: false,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        Constants.labelPassword,
                                                    icon: Icon(Icons.lock,
                                                        color: Colors.grey),
                                                    labelText:
                                                        Constants.labelPassword,
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.0)),
                                                  ),
                                                  validator: validatePassword,
                                                  controller:
                                                      _passwordController,
                                                  onSaved: (String value) {
                                                    _login.password = value;
                                                  },
                                                  style:
                                                      TextStyle(fontSize: 18.0),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 40.0),
                                                ),
                                                MaterialButton(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20.0)),
                                                    ),
                                                    height: 50.0,
                                                    minWidth: 150.0,
                                                    color: Color(0XFF03A9F4),
                                                    splashColor: Colors.blue,
                                                    textColor: Colors.white,
                                                    child: Text(
                                                        Constants.btnIngresar),
                                                    onPressed:
                                                        _handleSubmitted),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ))),
                )
              ],
            )));
  }

  String validateEmail(String value) {
    var pattern = Constants.pattern;
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
}
