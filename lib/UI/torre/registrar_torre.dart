import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/torre_bloc.dart';
<<<<<<< HEAD
=======
import 'package:tenic_api/modelo/departamento_model.dart';
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb
import 'package:tenic_api/modelo/municipio_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';
import 'package:tenic_api/resource/constants.dart';

class CrearTorre extends StatefulWidget {
  const CrearTorre({Key key}) : super(key: key);

  @override
  CrearTorreState createState() => CrearTorreState();
}

class CrearTorreState extends State<CrearTorre>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

<<<<<<< HEAD
  TorreBLoC torreBloc;
  Torre _torre = Torre(
    nombre: '',
    identificacion: '',
    direccion: '',
    coordenadas: '',
    altura: '',
    tecnologia: '',
    municipio: Municipio(idMunicipio: 0)//id

  );

=======
  TorreBloc torreBloc;
  Torre _torre = Torre(
      nombre:'',
      identificacion:'',
      direccion:'',
      coordenadas:'',
      altura:'',
      tecnologia:'',
      municipio: Municipio(idMunicipio: 0, departament: Departamento(idDpto: 0)));
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    torreBloc = TorreBLoC(context);

=======
    torreBloc = TorreBloc(context);
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb
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
      torreBloc.createTorre(_torre);
<<<<<<< HEAD


=======
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text(Constants.tittleRegistroTorre)),
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
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              _torre.nombre = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelIdentificacion,
                            ),
                            keyboardType: TextInputType.number,
                            //validator: validateName,
                            onSaved: (String value) {
                              _torre.identificacion = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelDireccion,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (String value) {
                              _torre.direccion = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelCoordenadas,
                            ),
                            onSaved: (String value) {
                              _torre.coordenadas = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelAltura,
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            validator: validateAltura,
                            onSaved: (String value) {
                              _torre.altura = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelTecnologia,
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            onSaved: (String value) {
                              _torre.tecnologia = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelMunicipio,
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            onSaved: (String municipio) {
                              _torre.municipio.idMunicipio = int.parse(municipio);
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
                              labelText: Constants.labelNombreTorre,
                            ),
                            validator: validateName,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              _torre.nombre = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          
                          const SizedBox(height: 12.0),
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelStringid_torre,
                            ),
                            //validator: validateName,
                            onSaved: (String value) {
                              _torre.identificacion = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelDirTorre,
                            ),
                            //keyboardType: TextInputType.emailAddress,
                            //maxLength: 32,
                            //validator: validateEmail,
                            onSaved: (String value) {
                              _torre.direccion = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          
                          TextFormField(
                            //obscureText: true,
                            //autocorrect: false,
                            decoration: new InputDecoration(
                              labelText: Constants.labelCoorTorre,
                            ),
                            //maxLength: 12,
                            //validator: validatePassword,
                            onSaved: (String value) {
                              _torre.coordenadas = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelAlturaTorre,
                            ),
                            //keyboardType: TextInputType.phone,
                            //maxLength: 12,
                            //validator: validateMobile,
                            onSaved: (String value) {
                              _torre.altura = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),

                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: Constants.labelTechTorre,
                            ),
                            //keyboardType: TextInputType.phone,
                            //maxLength: 12,
                            //validator: validateMobile,
                            onSaved: (String value) {
                              _torre.tecnologia = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          //
                          TextFormField(
                            decoration: new InputDecoration(
                              //labelText: Constants.tipoUsuario,
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            onSaved: (String mun) {
                              _torre.municipio.idMunicipio = int.parse(mun);
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

<<<<<<< HEAD
String validateName(String value) {
=======
  String validateName(String value) {
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb
    String pattern = Constants.patternNombre;
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return Constants.validateName;
    } else if (!regExp.hasMatch(value)) {
      return Constants.nameStructure;
    }
    return null;
  }
<<<<<<< HEAD
  
=======

    String validateAltura(String value) {
    if (value.length == 0) {
      return Constants.validateAltura;
    } else if (value.length != 2) {
      return Constants.alturaStructure;
    }
    return null;
  }
    String validateGrados(String value) {
    if (value.length == 0) {
      return Constants.validateOrientacion;
    } else if (value.length != 3) {
      return Constants.orientacionStructure;
    }
    return null;
  }
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb

}