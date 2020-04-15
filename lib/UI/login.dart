import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/inicio_sesion_bloc.dart';
import 'package:tenic_api/modelo/LoginUser.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/resource/constants.dart';



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
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
      showInSnackBar('corregir');
    } else {
      form.save();
        _validate = await inicioSesionBloc.iniciarSesion(_login);
      if(_validate){
        TecniNavigator.goToHomeCoordinador(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.tittleLogin),
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: Image(
            image: AssetImage(Constants.loginImage),
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
            color: Colors.black12,
          ),
        ),
        Center(
          child: Container(
            child: Theme(
              data: ThemeData(
                  brightness: Brightness.dark,
                  accentColor: Colors.blue,
                  primarySwatch: Colors.blue,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.white, fontSize: 18.0),
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
                              hintText: Constants.labelCorreo,
                              icon: Icon(Icons.mail, color: Colors.grey),
                              labelText: Constants.labelCorreo,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            maxLength: 32,
                            validator: validateEmail,
                            controller: _userNameController,
                            onSaved: (String value) {
                              _login.correo = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            obscureText: true,
                            autocorrect: false,
                            decoration: InputDecoration(
                              hintText: Constants.labelPassword,
                              icon: Icon(Icons.lock, color: Colors.grey),
                              labelText: Constants.labelPassword
                            ),
                            maxLength: 12,
                            validator: validatePassword,
                            controller: _passwordController,
                            onSaved: (String value) {
                              _login.password = value;
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
                              child: Text(Constants.btnIngresar),

                              //onPressed: (){inicioBloc.iniciarSesion(_login);}

                              onPressed: _handleSubmitted


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
    var pattern = Constants.pattern;
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
}