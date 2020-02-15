import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: SingleChildScrollView(
          child: LoginBody(),
          )
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  void Login(BuildContext context){

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/2.5,
          color: Colors.orange,
        )
      ],
    );
  }
}