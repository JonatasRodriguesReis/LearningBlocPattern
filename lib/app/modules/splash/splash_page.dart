import 'dart:async';

import 'package:flutter/material.dart';
import 'package:teste_slyde/app/app_bloc.dart';
import 'package:teste_slyde/app/app_module.dart';
import 'package:teste_slyde/app/modules/home/home_module.dart';
import 'package:teste_slyde/app/modules/login/login_module.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  bool finish = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), (){
      setState(() {
        AppModule.to.bloc<AppBloc>().userCurrent();
        this.finish = true;
      });
    });
  }

  _buildSplash(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  stream(){
    return StreamBuilder<Map<String,dynamic>>(
        stream: appBloc.outUserCurrent,
        builder: (_,snapshot){
          if(!snapshot.hasData)
            return this._buildSplash();
          
          var user = snapshot.data['user'];
          bool verified = snapshot.data['verified'];
          if(user == null && verified)
            return LoginModule();
          else
            if(user != null && verified)
            return HomeModule();
          
        }
      );
  }
  
  final appBloc = AppModule.to.getBloc<AppBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: this.finish ? stream() : _buildSplash(),
    );
  }
}
