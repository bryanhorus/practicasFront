
//import 'dart:js';

//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:tenic_api/UI/antena/registrar_antena.dart';
import 'package:tenic_api/UI/municipio/registrar_municipio.dart';
import 'package:tenic_api/UI/perfil.dart';
import 'package:tenic_api/resource/constants.dart';

import '../../navigator.dart';

class MunicipioUi extends StatelessWidget {
 /*Widget popupMenuButton(){
   return PopupMenuButton<String>(
     icon: Icon(Icons.add, size: 30.0,),
     itemBuilder: (BuildContext context)=><PopupMenuEntry<String>>[

       PopupMenuItem<String>(
         value: "regitrar",
         child: Text("registro")
         )


     ],
     onSelected: (a){
       if(a=="registrar"){   
       Navi
         //TecniNavigator.goToRegistrarMunicipio(context);
       }
       
          //Navigator.push(context
          //, new MaterialPageRoute(builder: (context) => new RegistrarAntena()));
       //.push(MaterialPageRoute(builder: (BuildContext context)=>CrearMunicipio()));

       
     },
     
      
   );
 }*/
  final List<Choice> choices = const <Choice>[
    const Choice(title: 'Perfil', icon: Icons.account_circle),
    const Choice(title: 'Salir', icon: Icons.exit_to_app),
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(Constants.tittleMunicipio),
        actions: <Widget>[
            PopupMenuButton<Choice>(
              onSelected: (val) => onItemMenuPress(val, context),
              itemBuilder: (BuildContext context) {
                return choices.map((Choice choice) {
                  return PopupMenuItem<Choice>(
                      value: choice,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            choice.icon,
                          ),
                          Container(
                            width: 10.0,
                          ),
                          Text(
                            choice.title,
                          ),
                        ],
                      ));
                }).toList();
              },
            ),
          ],
        ),
       
        body: Container(
          color: Colors.blue[50],
          child: MyStatelessMunicipio(),
        ));
  }
}

void onItemMenuPress(Choice choice,BuildContext context){
  if(choice.title == 'Perfil') {
      print("Logout");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfilePageDesign()));
    }
}

class Choice{
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

class MyStatelessMunicipio extends StatelessWidget {
  MyStatelessMunicipio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              TecniNavigator.goToRegistrarMunicipio(context);
            },
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text(Constants.btnRegistarM,
                  style: TextStyle(fontSize: 20)),
            ),
          ),
          const SizedBox(height: 30),
          RaisedButton(
            onPressed: () {
              TecniNavigator.goToListaMuncipio(context);
            },
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text(Constants.btnListaM,
                  style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }

  
}