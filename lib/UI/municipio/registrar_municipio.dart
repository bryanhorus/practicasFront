import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/UI/dialog.dart';
import 'package:tenic_api/bloc/departamento_bloc.dart';
import 'package:tenic_api/resource/constants.dart';
import '../../bloc/municipio_bloc.dart';
import '../../modelo/departamento_model.dart';
import '../../modelo/municipio_model.dart';

class CrearMunicipio extends StatefulWidget {
  const CrearMunicipio({Key key}) : super(key: key);

  @override
  CrearMunicipioState createState() => CrearMunicipioState();
}

class CrearMunicipioState extends State<CrearMunicipio>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final MunicipioBloc municipioBloc = MunicipioBloc();
  Municipio _municipio =
      Municipio(nombre: '', departament: Departamento(idDpto: 0));

  final DptoBloc dptoBloc = DptoBloc();
  List<Departamento> listaDpto = List();
  int currentDpto;

  @override
  void initState() {
    super.initState();
    DptoBloc();
    dptoBloc.listarDepartamento().then((apiResponse) {
      setState(() {
        listaDpto = apiResponse.listDepartamento;
      });
    });
    MunicipioBloc();
  }

  bool _autovalidate = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
    } else {
      form.save();
      municipioBloc.createMunicipio(_municipio);
      Message().showRegisterDialog(context);
    }
  }


  @override
  Widget build(BuildContext context) {
    currentDpto = listaDpto[0].idDpto;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text(Constants.tittleMunicipio)),
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
                          /* TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelDepartamento,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelDepartamento,
                                icon: Icon(Icons.assistant_photo)),
                            keyboardType: TextInputType.text,
                            onSaved: (String depart) {
                              _municipio.departament.idDpto = int.parse(depart);
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),*/
                          DropdownButtonHideUnderline(
                            child:  DropdownButton<int>(
                              hint: Text("Seleccionar"),
                              value: currentDpto,
                              isDense: true,
                              onChanged:  (int newValue) {
                                currentDpto = newValue;
                                setState(() {
                                  currentDpto = newValue;
                                });
                                print(currentDpto);
                                _municipio.departament.idDpto = newValue;
                                
                              },
                              items: listaDpto.map((Departamento map) {
                                return  DropdownMenuItem<int>(
                                  value: map.idDpto,
                                  child:  Text(map.nombre,
                                      style:  TextStyle(color: Colors.black)),
                                );
                              }).toList(),
                            ),
                          ),
                          Divider(),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelNombre,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: Constants.labelMunicipio,
                                icon: Icon(Icons.image)),
                            validator: validateName,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              _municipio.nombre = value;
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
                            color: Color(0xFF42a5f5),
                            splashColor: Colors.blue,
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
}
