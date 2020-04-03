import 'package:flutter/material.dart';
import 'package:tenic_api/resource/constants.dart';

class ActualizarAntena extends StatefulWidget {
  const ActualizarAntena({Key key}) : super(key: key);

  @override
  ActualizarAntenaState createState() => ActualizarAntenaState();
}

class ActualizarAntenaState extends State<ActualizarAntena>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  bool _autovalidate = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
    } else {
      form.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text(Constants.tittleRegistroAntena)),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: Image(
            image: AssetImage(Constants.registroImage),
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.difference,
            color: Colors.black12,
          ),
        ),
      ]),
    );
  }
}
