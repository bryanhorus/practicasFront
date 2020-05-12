import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/repository/repository.dart';
import 'package:tenic_api/resource/constants.dart';

class PerfilPage extends StatefulWidget {
  @override
  PerfilPageState createState() => PerfilPageState();
}

class PerfilPageState extends State<PerfilPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autovalidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Repository repository = Repository();

  String nombre = '';
  String apellido = '';
  String correo = '';
  String telefono = '';
  String rol = '';

  @override
  void initState() {
    super.initState();
    _handleSubmitted();
  }

  void _handleSubmitted() async {
    nombre = await repository.getLocalNombre();
    apellido = await repository.getLocalApellido();
    correo = await repository.getLocalCorreo();
    telefono = await repository.getLocalTelefono();
    rol = await repository.getLocalRol();
    setState(() {
      nombre;
      apellido;
      correo;
      telefono;
      rol;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text(Constants.perfil),
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
                              Column(
                                children: <Widget>[
                                  Container(
                                    width: 90,
                                    margin:
                                        EdgeInsets.only(top: size.width * 0.2),
                                    height: 90,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image:
                                              AssetImage(Constants.perfilImage),
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
                                  Text('Usuario', textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                  ),
                                  Text(
                                    nombre + ' ' + apellido,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
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
                                                  enabled: false,
                                                  decoration: InputDecoration(
                                                    icon: Icon(Icons.email,
                                                        color: Colors.blue),
                                                        
                                                    labelText: correo,
                                                  ),
                                                  style:
                                                      TextStyle(fontSize: 18.0),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                ),
                                                TextFormField(
                                                  enabled: false,
                                                  decoration: InputDecoration(
                                                      icon: Icon(Icons.call,
                                                          color: Colors.blue),
                                                      labelText: telefono),
                                                  style:
                                                      TextStyle(fontSize: 18.0),
                                                ),
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
}
