import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/municipio_bloc.dart';
import 'package:tenic_api/modelo/municipio_model.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/resource/constants.dart';

class ActualizarMunicipio extends StatefulWidget {
  final Municipio municipio;
  const ActualizarMunicipio({this.municipio, Key key}) : super(key: key);

  @override
  ActualizarMunicipioState createState() =>
      ActualizarMunicipioState(municipio: municipio);
}

class ActualizarMunicipioState extends State<ActualizarMunicipio>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ActualizarMunicipioState({this.municipio});
  MunicipioBloc municipioBloc;

  Municipio municipio;

  @override
  void initState() {
    super.initState();
    municipioBloc = MunicipioBloc(context);
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
      municipioBloc.updateMunicipio(municipio);
    }
    TecniNavigator.goToHomeCoordinador(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text(Constants.tittleMunicipioactualizar)),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
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
                               border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),

                            ),
                            validator: validateName,
                            initialValue: municipio.nombre,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              municipio.nombre = value;
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
