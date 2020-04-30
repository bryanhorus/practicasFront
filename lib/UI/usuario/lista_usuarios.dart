import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/usuario_bloc.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/usuario_model.dart';
import 'package:tenic_api/resource/constants.dart';
import 'package:tenic_api/navigator.dart';
import 'actualizar_usuario.dart';

class ListaUsuarios extends StatefulWidget {
  const ListaUsuarios({Key key}) : super(key: key);

  @override
  ListaUsuariosState createState() => ListaUsuariosState();
}

class ListaUsuariosState extends State<ListaUsuarios>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final UsuarioBloc userBloc = UsuarioBloc();
  ApiResponse apiResponse;
  Usuario usuario;

  showDeleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title:
                Row(children: [Icon(Icons.info), Text(Constants.tittleDialog)]),
            content: Text(Constants.eliminado),
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
                  TecniNavigator.goToListaUsuarios(context);
                },
              )
            ],
          );
        });
  }

  List<Usuario> listUsuario = List();

  _handleSubmitted() {
    userBloc.listarUsuario().then((apiResponse) {
      setState(() {
        listUsuario = apiResponse.listUsuario;
      });
    });
  }

  void _delete(Usuario usuario) {
    userBloc.deleteUsuario(usuario);
    showDeleteDialog(context);
  }

  @override
  void initState() {
    super.initState();
    UsuarioBloc();
    _handleSubmitted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(Constants.tittleListaUsuarios),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () {
              TecniNavigator.goToRegistrarUsuario(context);
            },
          ),
        ],
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            itemCount: listUsuario.length,
            itemBuilder: (BuildContext context, int indice) {
              return Card(
                  color: Colors.blueAccent[indice],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text(listUsuario[indice].nombre,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold)
                                ),
                                subtitle: Text(listUsuario[indice].correo),
                                leading: Icon(Icons.face),
                        onTap: () {
                          usuario = listUsuario[indice];
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ActualizarUsuario(
                                        usuario: usuario,
                                      )));
                        },
                      ),
                      // ignore: deprecated_member_use
                      ButtonTheme.bar(
                        child: ButtonBar(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                usuario = listUsuario[indice];
                                _delete(usuario);
                              },
                            ),
                          ],
                        ),
                      ),

                    ],
                  ));
            },
          ),
        ),
      ]),
    );
  }
}
