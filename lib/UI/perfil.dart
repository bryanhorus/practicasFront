import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:tenic_api/bloc/inicio_sesion_bloc.dart';
import 'package:tenic_api/modelo/LoginUser.dart';
import 'package:tenic_api/navigator.dart';
=======
>>>>>>> d27eb01bee6777e452aa97d90c507e5dec672ce0
import 'package:tenic_api/repository/repository.dart';
import 'package:tenic_api/resource/constants.dart';

class PerfilPage extends StatefulWidget {
  @override
  PerfilPageState createState() => PerfilPageState();
}

<<<<<<< HEAD
Login _login = Login(
  correo: ""
);

class ProfilePageDesignState extends State<ProfilePageDesign> 
with SingleTickerProviderStateMixin{

  String rol;

   @override
  void initState() async {
    super.initState();
    InicioSesionBloc();
    final Repository _repository = Repository();
    rol = await _repository.getLocalNombre();
  }


  TextStyle _style(){
    return TextStyle(
      fontWeight: FontWeight.bold
    );
  }
    /*@override
  void initState() {
    super.initState();

  }*/


=======
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

>>>>>>> d27eb01bee6777e452aa97d90c507e5dec672ce0
  @override
  void initState() {
    super.initState();
    _handleSubmitted();
  }

<<<<<<< HEAD
  /*void _handleSubmitted() async {
    final Repository _repository = Repository();
    String nombre = await _repository.getLocalNombre();
    String apellido = await _repository.getLocalApellido();
    
      }*/


=======
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
>>>>>>> d27eb01bee6777e452aa97d90c507e5dec672ce0

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text(Constants.perfil),
        ),
<<<<<<< HEAD
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white,),
                  onPressed: (){
                    TecniNavigator.goToHomeCoordinador(context);},
                ),

                Text(Constants.perfil, style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),),
                IconButton(
                  icon: Icon(Icons.brightness_1, color: Colors.lightBlue,),
                  onPressed: (){
                    TecniNavigator.goToHomeCoordinador(context);},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(Constants.perfilImage)
                          )
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("AQUÍ", style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                    ),),
                    Text('3196399117', style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                    ),)
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(Constants.trabajador, style: TextStyle(
                        color: Colors.white
                    ),),
                    Text('Bryan alvarado', style: TextStyle(
                        fontSize: 26,
                        color: Colors.white
                    ),)
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
=======
        body: Container(
            width: size.width,
            height: size.height,
            child: Stack(
>>>>>>> d27eb01bee6777e452aa97d90c507e5dec672ce0
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
