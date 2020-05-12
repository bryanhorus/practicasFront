import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/enviar_correo_bloc.dart';
import 'package:tenic_api/modelo/enviar_model.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/resource/constants.dart';

class EnviarEmailPage extends StatefulWidget {
  @override
  EnviarEmailPageState createState() => EnviarEmailPageState();
}

class EnviarEmailPageState extends State<EnviarEmailPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autovalidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CorreoBloc correoBloc = CorreoBloc();
  Correo _correo = Correo(body: '', asunto: '',correo: List());
  @override
  void initState() {
    super.initState();
  }



  void _handleSubmitted()async {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
    } else {
      form.save();
      final res = await correoBloc.enviaCorreo(_correo);
      showEnviadoDialog(context);
      
    }
  }
  showEnviadoDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title:
                Row(children: [Icon(Icons.info), Text(Constants.tittleDialog)]),
            content: Text(Constants.correo),
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
                onPressed: (){TecniNavigator.goToEnviarCorreo(context);}
              )
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text(Constants.appBarCorreo),
        ),
        body: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                    child: SafeArea(
                        child: Container(
                            width: size.width,
                            child: Column(
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
                                                padding: const EdgeInsets.only(
                                                    top: 40.0),
                                              ),
                                              const SizedBox(height: 12.0),
                                              TextField(
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        Constants.labelCorreo,
                                                    icon: Icon(Icons.person,
                                                        color: Colors.grey),
                                                    labelText:
                                                        Constants.labelCorreo,
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.0)),
                                                  ),
                                                  onChanged: (  String value ) {
                                                    _correo.correo = value.split(" ");
                                                    print(_correo.correo);
                                                  },
                                                  style:
                                                      TextStyle(fontSize: 18.0),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20.0),
                                                ),
                                              TextFormField(
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'Asunto',
                                                    icon: Icon(Icons.create,
                                                        color: Colors.grey),
                                                    labelText:
                                                        'Asunto',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.0)),
                                                  ),
                                                  textCapitalization: TextCapitalization.sentences,
                                                  onSaved: (String value) {
                                                    _correo.asunto = value.trim();
                                                  },
                                                  style:
                                                      TextStyle(fontSize: 18.0),
                                                ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20.0),
                                              ),
                                              Container(              
                                                width: 1000.0,
                                                child: 
                                              TextFormField(
                                                  decoration: InputDecoration(
                                                    contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                                                    hintText:
                                                        'Mensaje',
                                                    icon: Icon(Icons.email,
                                                        color: Colors.grey),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.0)),
                                                  ),
                                                  textCapitalization: TextCapitalization.sentences,
                                                  onSaved: (String value) {
                                                    _correo.body = value.trim();
                                                  },
                                                  style:
                                                      TextStyle(fontSize: 18.0, height: 2.0),
                                            ),),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20.0),
                                                ),
                                              MaterialButton(
                                                shape: RoundedRectangleBorder(
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
                                                child:
                                                    Text(Constants.btnEnviar),
                                                onPressed: _handleSubmitted,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ))))
              ],
            )));
  }
}
