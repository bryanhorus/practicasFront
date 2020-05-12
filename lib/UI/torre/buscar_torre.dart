import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/municipio_bloc.dart';
import 'package:tenic_api/bloc/torre_bloc.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/municipio_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';
import 'package:tenic_api/navigator.dart';

class ListaBuscarTorrePage extends StatefulWidget{
  
  const ListaBuscarTorrePage({Key key}) : super(key: key);

  @override
  ListaBuscarTorrePageState createState() => ListaBuscarTorrePageState();
  }

class ListaBuscarTorrePageState extends State<ListaBuscarTorrePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    bool _autovalidate = false;
  List<Torre> listBusqueda = List();
  final MunicipioBloc municipioBloc = MunicipioBloc();
  TorreBloc torreBloc = TorreBloc();
  List<Municipio> listMunicipio = List();
  ApiResponse apiResponse;
  int currenMunicipio;
  Torre torre = Torre(municipio: Municipio(idMunicipio: 0));

  @override
  void initState() {
      MunicipioBloc();
    municipioBloc.listarMunicipio().then((apiresponse) {
      setState(() {
        listMunicipio = apiresponse.listMunicipio;
      });
    });
    super.initState();
    torreBloc = TorreBloc();
  }

    void _handleSubmitted() {
    torreBloc.listarBusqueda(torre).then((apiResponse) {
      setState(() {
        listBusqueda = apiResponse.listTorre;
      });
    });
  }



    @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Torres Por Municipio"),
        actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () {TecniNavigator.goToRegistrarTorre(context);},
            ),
          ],),
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
                              hint: Text("Municipio"),
                              value: currenMunicipio,
                              isDense: true,
                              onChanged: (int newValue) {
                                currenMunicipio = newValue;
                                setState(() {
                                  currenMunicipio = newValue;
                                });
                                print(currenMunicipio);
                                torre.municipio.idMunicipio = newValue;
                              _handleSubmitted();
                              },
                              
                              items: listMunicipio.map((Municipio map) {
                                return DropdownMenuItem<int>(
                                  value: map.idMunicipio,
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
                          listBusqueda[indice].nombre,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)
                                ),
                                subtitle: Text(listBusqueda[indice].direccion),
                      leading: Icon(Icons.settings_input_antenna),
                                onTap: (){
                      torre = listBusqueda[indice];},
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