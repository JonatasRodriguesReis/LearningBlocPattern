import 'package:teste_slyde/app/modules/home/home_bloc.dart';
import 'package:teste_slyde/app/modules/login/login_bloc.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:teste_slyde/app/app_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:teste_slyde/app/app_widget.dart';

class AppModule extends ModuleWidget {
  AppModule(){
    Parse().initialize(
      "xXJL5MWBPATUGL28PN3T8e5LcIotlGk0O731bUKh",
      "https://parseapi.back4app.com/",
      masterKey: "mgEkTm9XAAjF7UuJvmWxGu94rlQWkQhCQZEs7vHo",
      debug: true,
      liveQueryUrl: "true",
    );
  }

  @override
  List<Bloc> get blocs => [
        Bloc((i) => LoginBloc()),
        Bloc((i) => HomeBloc()),
        Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
