

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:limpio/utils/app_colors.dart';

void showMessage(BuildContext context,String msg,{bool error = false}){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg,style: TextStyle(color: AppColors.white),),backgroundColor: error ?
  AppColors.snackbar_error:
  AppColors.snackbar
    ,));
}