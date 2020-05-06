import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/UI/torre/actualizar_torre.dart';
import 'package:tenic_api/bloc/torre_bloc.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';
import 'package:tenic_api/resource/constants.dart';
import 'package:nominatim_location_picker/nominatim_location_picker.dart';
import '../../navigator.dart';

class ListaTorre extends StatefulWidget {
  final Torre torre;
  const ListaTorre({Key key, this.torre}) : super(key: key);

  @override
  _ListaTorreState createState() => _ListaTorreState();
}

class _ListaTorreState extends State<ListaTorre>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Torre torre;
  final TorreBloc torreBloc = TorreBloc();
  ApiResponse apiResponse;

  List<Torre> listTorre = List();

  _handleSubmitted() {
    torreBloc.listarTorre().then((apiResponse) {
      setState(() {
        listTorre = apiResponse.listTorre;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    TorreBloc();
    _handleSubmitted();
  }
  Map _pickedLocation;
  var _pickedLocationText;

  Future getLocationWithNominatim() async {
    Map result = await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return NominatimLocationPicker(
            searchHint: 'Buscar',
            awaitingForLocation: "Esperando su localizacion",
          );
        });
    if (result != null) {
      setState(() => _pickedLocation = result);
    } else {
      return;
    }
  }

  RaisedButton nominatimButton(Color color, String name) {
    return RaisedButton(
      color: color,
      onPressed: () async {
        await getLocationWithNominatim();
      },
      textColor: Colors.white,
      child: Center(
        child: Text(name),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.tittleListaTorre),
        actions: <Widget>[
          nominatimButton(Colors.blue, 'MAPA'),
            IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () {TecniNavigator.goToRegistrarTorre(context);},
            ),
          ],
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[

        Container(

          child:  ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(15.0),
            itemCount: listTorre.length,
            itemBuilder: (BuildContext context, int indice) {
              return Card(
                color: Colors.blue[indice],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        listTorre[indice].nombre,
                          style: TextStyle(fontSize: 20, color: Colors.black87,fontWeight: FontWeight.bold)
                          ),
                      subtitle: Text(listTorre[indice].identificacion),
                      leading: Icon(Icons.place),
                      onTap: () {
                        print(listTorre[indice].nombre);
                        torre = listTorre[indice];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ActualizarTorre(
                                      torre: torre,
                                    )));
                      },
                    ),
                    // ignore: deprecated_member_use
                    ButtonTheme.bar(
                      child: ButtonBar(
                        children: <Widget>[

                          IconButton(
                            icon: Icon(Icons.map),
                            onPressed: () {
                              nominatimButton(Colors.blue, 'Mapa');
                             /* torre = listTorre[indice];
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Mapa(
                                            torre: torre,
                                          )));*/
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

        ),
      ]),
    );
  }
}