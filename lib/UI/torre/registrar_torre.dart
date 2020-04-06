import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/torre_bloc.dart';
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

  TorreBLoC torreBloc;
  Torre _torre = Torre(
    nombreTorre: '',
    direccionTorre: '',
    coordenadas: '',
    altura: '',
    tecnologia: '',
    municipio: Municipio(id: 0)//id

  );


  @override
  void initState() {
    super.initState();
    torreBloc = TorreBLoC(context);

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
                              labelText: Constants.labelNombreTorre,
                            ),
                            //validator: validateName,
                            //keyboardType: TextInputType.emailAddress,
                            onSaved: (String value) {
                              _torre.nombreTorre = value;
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
                              _torre.identificacionTorre = value;
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
                              _torre.direccionTorre = value;
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
                              _torre.altura = value;
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
                              _torre.municipio.id = int.parse(mun);
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


  

}