import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/municipio_bloc.dart';
import 'package:tenic_api/bloc/torre_bloc.dart';
import 'package:tenic_api/modelo/departamento_model.dart';
import 'package:tenic_api/modelo/municipio_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/resource/constants.dart';

class CrearTorre extends StatefulWidget {
  const CrearTorre({Key key}) : super(key: key);

  @override
  CrearTorreState createState() => CrearTorreState();
}

class CrearTorreState extends State<CrearTorre>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final MunicipioBloc municipioBloc = MunicipioBloc();
  List<Municipio> listaMunicipio = List();
  int currentMunicipio;

  final TorreBloc torreBloc = TorreBloc();
  Torre _torre = Torre(
      nombre: '',
      identificacion: '',
      direccion: '',
      coordenadas: '',
      altura: '',
      tecnologia: '',
      municipio:
          Municipio(idMunicipio: 0, departament: Departamento(idDpto: 0)));

  @override
  void initState() {
    MunicipioBloc();
    municipioBloc.listarMunicipio().then((apiResponse) {
      setState(() {
        listaMunicipio = apiResponse.listMunicipio;
      });
    });
    super.initState();
    TorreBloc();
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
                onPressed: () {
                  TecniNavigator.goToListaTorre(context);
                },
              )
            ],
          );
        });
  }

  bool _autovalidate = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
    } else {
      form.save();
      torreBloc.createTorre(_torre);
      showRegisterDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text(Constants.tittleRegistroTorre)),
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
                                icon: Icon(Icons.settings_input_antenna)),
                            validator: validateName,
                            textCapitalization: TextCapitalization.sentences,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              _torre.nombre = value.trim();
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration:  InputDecoration(
                                labelText: Constants.labelIdentificacion,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelIdentificacion,
                                icon: Icon(Icons.perm_identity)),
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            validator: validateNumeros,
                            onSaved: (String value) {
                              _torre.identificacion = value.trim();
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelDireccion,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelDireccion,
                                icon: Icon(Icons.directions)),
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              _torre.direccion = value.trim();
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration:  InputDecoration(
                                labelText: Constants.labelCoordenadas,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelCoordenadas,
                                icon: Icon(Icons.map)),
                                keyboardType: TextInputType.text,
                                validator: validateName,
                                textCapitalization: TextCapitalization.sentences,
                            onSaved: (String value) {
                              _torre.coordenadas = value.trim();
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration:  InputDecoration(
                                labelText: Constants.labelAltura,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelAltura,
                                icon: Icon(Icons.show_chart)),
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            validator: validateNumeros,
                            onSaved: (String value) {
                              _torre.altura = value.trim();
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          DropdownButtonHideUnderline(
                            child:  DropdownButton<int>(
                              hint: Text("Seleccionar"),
                              value: currentMunicipio,
                              isDense: true,
                              onChanged:  (int newValue) {
                                currentMunicipio = newValue;
                                setState(() {
                                  currentMunicipio = newValue;
                                });
                                print(currentMunicipio);
                                _torre.municipio.idMunicipio = newValue;
                                
                              },
                              items: listaMunicipio.map((Municipio map) {
                                return  DropdownMenuItem<int>(
                                  value: map.idMunicipio,
                                  child:  Text(map.nombre,
                                      style:  TextStyle(color: Colors.black)),
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

  String validateNumeros(String value) {
    String pattern = Constants.patterNumero;
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return Constants.validateAltura;
    } else if (!regExp.hasMatch(value)){
      return Constants.estructura;
    }
    return null;
  }

}
