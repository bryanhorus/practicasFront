import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/departamento_bloc.dart';
import 'package:tenic_api/modelo/departamento_model.dart';
import 'package:tenic_api/resource/constants.dart';

class ActualizarDepartamento extends StatefulWidget {
  const ActualizarDepartamento({Key key}) : super(key: key);

  @override
  ActualizarDepartamentoState createState() => ActualizarDepartamentoState();
}

class ActualizarDepartamentoState extends State<ActualizarDepartamento>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  DptoBloc departamentoBloc;
  Departamento _departamento = Departamento(nombre: '', idDpto: 0);

  @override
  void initState() {
    super.initState();
    departamentoBloc = DptoBloc(context);
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  bool _autovalidate = false;
  //bool _formWasEdited = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //final GlobalKey<FormFieldState<String>> _passwordFieldKey =
  //GlobalKey<FormFieldState<String>>();

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
    } else {
      form.save();

      //_tecnico.tipoUsuario = 'descripcion';
      departamentoBloc.updateDepartamento(_departamento);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text(Constants.tittleDepartamentoactualizar)),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: Image(
            image: AssetImage(Constants.registroImage),
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.difference,
            color: Colors.black12,
          ),
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
                              labelText: "Posicion",
                            ),
                            //validator: validateName,
                            keyboardType: TextInputType.number,
                            onSaved: (String value) {
                              _departamento.idDpto = int.parse(value);
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelNombre,
                            ),
                            validator: validateName,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              _departamento.nombre = value;
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
                            color: Color(0xFFE1F5FE),
                            splashColor: Colors.blueAccent,
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
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return Constants.validateName;
    } else if (!regExp.hasMatch(value)) {
      return Constants.nameStructure;
    }
    return null;
  }
}