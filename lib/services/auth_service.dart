

import 'package:limpio/models/user_data.dart';

class AuthService{

  Future<UserDataModel?> login_with_email(String email, String password)async{
    try{
      return UserDataModel();
    }catch(e){
      return null;
    }
  }


  Future<bool> register_with_email(UserDataModel? userDataModel)async{
    try{
      return true;
    }catch(e){
      return false;
    }
  }
}