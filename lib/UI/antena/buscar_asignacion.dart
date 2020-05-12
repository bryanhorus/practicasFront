import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/asignar_antena.dart';
import 'package:tenic_api/bloc/torre_bloc.dart';
import 'package:tenic_api/bloc/usuario_bloc.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/asignar_antena.dart';
import 'package:tenic_api/modelo/usuario_model.dart';

class ListaBuscarAsignacionPage extends StatefulWidget{
  
  const ListaBuscarAsignacionPage({Key key}) : super(key: key);

  @override
  ListaBuscarAsignacionPageState createState() => ListaBuscarAsignacionPageState();
  }

class ListaBuscarAsignacionPageState extends State<ListaBuscarAsignacionPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    bool _autovalidate = false;
  List<AsignarAntena> listBusqueda = List();
  final UsuarioBloc usuarioBloc = UsuarioBloc();
  AsignarAntenaBloc asignarBloc = AsignarAntenaBloc();
  List<Usuario> listUser = List();
  ApiResponse apiResponse;
  int currenUser;
  AsignarAntena asignar = AsignarAntena(usuario: Usuario(idUsuario: 0));

  @override
  void initState() {
      UsuarioBloc();
    usuarioBloc.listarUsuario().then((apiresponse) {
      setState(() {
        listUser = apiresponse.listUsuario;
      });
    });
    super.initState();
    asignarBloc = AsignarAntenaBloc();
  }

    void _handleSubmitted() {
    asignarBloc.listaBusquedaAsignar(asignar).then((apiResponse) {
      setState(() {
        listBusqueda = apiResponse.listAsignarAntena;
      });
    });
  }



    @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Asignaciones por Usuario")),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Center(
          child: Container(
            child: Theme(
              data: ThemeData(
                  brightness: Brightness.light,
                  hintColor: Colors.blue,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.black, fontSize: 10.0),
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
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              hint: Text("Técnico"),
                              value: currenUser,
                              isDense: true,
                              onChanged: (int newValue) {
                                currenUser = newValue;
                                setState(() {
                                  currenUser = newValue;
                                });
                                print(currenUser);
                                asignar.usuario.idUsuario = newValue;
                              _handleSubmitted();
                              },
                              
                              items: listUser.map((Usuario map) {
                                return DropdownMenuItem<int>(
                                  value: map.idUsuario,
                                  child: Text(map.nombre,
                                      style: TextStyle(color: Colors.blue)),
                                );
                              }).toList(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 60.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),),
          Center(
        child:
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            itemCount: listBusqueda.length,
            itemBuilder: (BuildContext context, int indice) {
              return Card(
                  color: Colors.blueAccent[indice],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          listBusqueda[indice].antena.nombre,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)
                                ),
                                subtitle: Text(listBusqueda[indice].antena.torre.municipio.nombre),
                      leading: Icon(Icons.person_pin),
                                onTap: (){
                      asignar = listBusqueda[indice];},
                      )
                    ],
                  ));
            },
          ),
        ),
        ),
      ]),
    );
  }
}