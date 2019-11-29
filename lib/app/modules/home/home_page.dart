import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:teste_slyde/app/app_bloc.dart';
import 'package:teste_slyde/app/app_module.dart';
import 'package:teste_slyde/app/modules/home/home_module.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final appBloc = AppModule.to.getBloc<AppBloc>();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<String,dynamic>>(
        stream: appBloc.outUserCurrent,
        builder: (_,snapshot){ 

          var body;
          if(snapshot.hasData){
            var user = snapshot.data['user'] as ParseUser;
            if(user == null){
              Navigator.of(context).pop();
            }

            body = Column(
              children: <Widget>[
                Text(user.username),
                Text(user.emailAddress),
                Text(user.get('objectId')),
                OutlineButton(
                  onPressed: ()=>appBloc.logOut(),
                  child: Text('Sair'),
                )
              ],
            );  
          }else{
            body = Container();
          }

          return Scaffold(
            body: body,
          );
        },
      );
  }
}
