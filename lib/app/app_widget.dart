import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:teste_slyde/app/app_bloc.dart';
import 'package:teste_slyde/app/app_module.dart';
import 'package:teste_slyde/app/modules/home/home_module.dart';
import 'package:teste_slyde/app/modules/splash/splash_module.dart';

class AppWidget extends StatelessWidget  {
  // final appBloc = AppModule.to.getBloc<AppBloc>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashModule() /* StreamBuilder<Map<String,dynamic>>(
        stream: appBloc.outUserCurrent,
        builder: (_,snapshot){
          var user = snapshot.data['user'];
          bool verified = snapshot.data['virified'];
          if(user == null && !verified)
            return SplashModule();

        }
      ), */
    );
  }
}
