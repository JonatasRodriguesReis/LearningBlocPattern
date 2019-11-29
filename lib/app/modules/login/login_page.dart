import 'package:flutter/material.dart';
import 'package:teste_slyde/app/app_bloc.dart';
import 'package:teste_slyde/app/app_module.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          OutlineButton(
            onPressed: (){
              AppModule.to.getBloc<AppBloc>().login();
            },
            child: Text('Login'),
          )
        ],
      ),
    );
  }
}
