import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:rxdart/rxdart.dart';

class AppBloc extends BlocBase {
  
  BehaviorSubject<Map<String,dynamic>> _userController = BehaviorSubject.seeded({
    'user':null,
    'verified':false
  });

  Observable<Map<String,dynamic>> get outUserCurrent {
    print('OutStrem');
    return _userController.stream;
  } 

  login() async{
    var response = await ParseUser.createUser('jonatassreis13@gmail.com', '123').login();
    if(response.success){
      var user = await ParseUser.currentUser() as ParseUser;
      print(user);
      this._userController.value['user'] = user;
      this._userController.value['verified'] = true;
      this._userController.add(this._userController.value);
    }
  }

  logOut() async{
    var user = this._userController.value['user'] as ParseUser;
    if(user != null) await user.logout();
    this._userController.value['user'] = null;
    this._userController.add(this._userController.value);
  }

  userCurrent() async{
    var user = await ParseUser.currentUser() as ParseUser;
    print("bloc");
    if(user != null){
      
      this._userController.value['user'] = user;
      this._userController.value['verified'] = true;
      this._userController.add(this._userController.value);
    }
    else{
      this._userController.value['user'] = null;
      this._userController.value['verified'] = true;
      this._userController.add(this._userController.value);
    }
    
  }



  @override
  void dispose() {
    super.dispose();
  }
}
