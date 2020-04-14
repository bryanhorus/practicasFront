import 'package:flutter/material.dart';
import 'package:tenic_api/modelo/LoginUser.dart';
import 'package:tenic_api/modelo/usuario_model.dart';
import 'package:tenic_api/navigator.dart';
import 'dart:math' as math;
import 'package:tenic_api/resource/constants.dart';

class ProfilePageDesign extends StatefulWidget {
  final LoginUser usuario;
    const ProfilePageDesign({this.usuario, key}) : super(key: key);

  @override
  ProfilePageDesignState createState() => ProfilePageDesignState(usuario: usuario);
}

class ProfilePageDesignState extends State<ProfilePageDesign> 
with SingleTickerProviderStateMixin{

    ProfilePageDesignState({this.usuario});

    LoginUser usuario = LoginUser(nombre: '', correo: '', telfono: '');
  TextStyle _style(){
    return TextStyle(
      fontWeight: FontWeight.bold
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            Text(Constants.mensajePerfil, style: _style(),),
            SizedBox(height: 4,),
            Text(Constants.agradecimiento),
            SizedBox(height: 20,),
            
            Divider(color: Colors.lightBlue,)
          ],
        ),
      ),
    );
  }
}


class CustomAppBar extends StatelessWidget
  with PreferredSizeWidget{
CustomAppBar({this.usuario});

    LoginUser usuario = LoginUser(nombre: '', correo: '', telfono: '');
  @override
  Size get preferredSize => Size(double.infinity, 320);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(top: 4),
        decoration: BoxDecoration(
          color: Colors.lightBlue
        ),
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
                    Text('Stefania@gmail.com', style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                    ),),
                    Text('3166950211', style: TextStyle(
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
                    
                    Text(
                      'Stefania Ramirez', style: TextStyle(
                        fontSize: 26,
                        color: Colors.white
                    ),)
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
              ],
            ),
            SizedBox(height: 8,),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: (){
                  print("//TODO: button clicked");
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 24, 16, 0),
                  child: Transform.rotate(
                    angle: (math.pi * 0.05),
                    child: Container(
                      width: 110,
                      height: 32,
                      child: Center(child: Text("Editar"),),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20
                          )
                        ]
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    Path p = Path();

    p.lineTo(0, size.height-70);
    p.lineTo(size.width, size.height);

    p.lineTo(size.width, 0);

    p.close();

    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}