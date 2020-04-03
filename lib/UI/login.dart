import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/inicio_sesion_bloc.dart';
import 'package:tenic_api/modelo/usuario_model.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/resource/constants.dart';



class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autovalidate = false;
  bool _validate;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  InicioSesionBloc inicioBloc;
  Usuario _usuario = Usuario(
    correo: "",
    password: "",
  );
  @override
  void initState() {
    super.initState();
    inicioBloc = InicioSesionBloc(context);
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
    } else {
      form.save();
      _validate = await inicioBloc.iniciarSesion(_usuario);
      if(_validate){
        TecniNavigator.goToHomeCoordinador(context);
      }

      
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                            decoration: new InputDecoration(
                              hintText: Constants.labelCorreo,
                              icon: Icon(Icons.mail, color: Colors.grey),
                              labelText: Constants.labelCorreo,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            maxLength: 32,
                            validator: validateEmail,
                            onSaved: (String value) {
                              _usuario.correo = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            obscureText: true,
                            autocorrect: false,
                            decoration: new InputDecoration(
                              hintText: Constants.labelPassword,
                              icon: Icon(Icons.lock, color: Colors.grey),
                              labelText: Constants.labelPassword,
                            ),
                            maxLength: 12,
                            validator: validatePassword,
                            onSaved: (String value) {
                              _usuario.password = value;
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
                              onPressed: (){
                                //_handleSubmitted,
                                TecniNavigator.goToHomeCoordinador(context);},
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