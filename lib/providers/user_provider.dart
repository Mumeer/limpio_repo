

import 'package:flutter/cupertino.dart';
import 'package:limpio/models/user_data.dart';
import 'package:limpio/services/auth_service.dart';
import 'package:limpio/utils/common_snackbar.dart';
import 'package:limpio/utils/routes.dart';

class UserProvider with ChangeNotifier{
  UserDataModel? currentUser;
  AuthService authService = AuthService();

  Future<void> login_with_email(BuildContext context,String email,String password)async{
    UserDataModel? user = await authService.login_with_email(email, password);
    if(user == null){
      showMessage(context, "login failed",error: true);
      return;
    }else {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    }
  }

  Future<void> register_with_email(BuildContext context,UserDataModel? userDataModel)async{
    bool check = await authService.register_with_email(userDataModel);
    if(check){
      showMessage(context, "Register failed",error: true);
      return;
    }else {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    }
  }

  Future<void> logout(BuildContext context)async{
    Navigator.of(context).pushReplacementNamed(Routes.login);
  }
}