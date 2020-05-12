import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/antena_bloc.dart';
import 'package:tenic_api/bloc/observacion_bloc.dart';
import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/observacion_model.dart';

class ListaBusquedaPage extends StatefulWidget{
  
  const ListaBusquedaPage({Key key}) : super(key: key);

  @override
  ListaBusquedaPageState createState() => ListaBusquedaPageState();
  }

class ListaBusquedaPageState extends State<ListaBusquedaPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    bool _autovalidate = false;
  List<Observacion> listBusqueda = List();
  final AntenaBloc antenaBloc = AntenaBloc();
  List<Antena> listAntena = List();
  ObservacionBloc observationBloc;
  ApiResponse apiResponse;
  int currenAntena;
  Observacion observacion= Observacion(antena: Antena(idAntena: 0));

  @override
  void initState() {
      AntenaBloc();
    antenaBloc.listarAntena().then((apiresponse) {
      setState(() {
        listAntena = apiresponse.listAntena;
      });
    });
    super.initState();
    observationBloc = ObservacionBloc();
    //_handleSubmitted();
  }

    void _handleSubmitted() {
    observationBloc.buscarObservacion(observacion).then((apiResponse) {
      setState(() {
        listBusqueda = apiResponse.listbusqueda;
      });
    });
  }



    @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Observaciones por Antena")),
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
                              hint: Text("Antena"),
                              value: currenAntena,
                              isDense: true,
                              onChanged: (int newValue) {
                                currenAntena = newValue;
                                setState(() {
                                  currenAntena = newValue;
                                });
                                print(currenAntena);
                                observacion.antena.idAntena = newValue;
                              _handleSubmitted();
                              },
                              
                              items: listAntena.map((Antena map) {
                                return DropdownMenuItem<int>(
                                  value: map.idAntena,
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
                                subtitle: Text(listBusqueda[indice].fecha),
                      leading: Icon(Icons.featured_play_list),
                                onTap: (){ print(listBusqueda[indice].idObservacion);
                    observacion = listBusqueda[indice];},
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