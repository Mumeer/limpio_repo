

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:limpio/providers/user_provider.dart';
import 'package:limpio/utils/app_colors.dart';
import 'package:limpio/views/bottom_nav_bar/bottom_nav_bar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool show_in_public = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.secondary,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text("Home"),
        backgroundColor: AppColors.secondary,
        centerTitle: true,
        actions: [
          InkWell(
              onTap: (){
                context.read<UserProvider>().logout(context);
              },
              child: Icon(Icons.logout))
        ],
      ),
      backgroundColor: AppColors.hint,
      body: SizedBox.expand(
        child:
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          SwitchListTile(
          title: const Text('Public'),
          value: show_in_public,
          onChanged: (bool value) {
            setState(() {
              show_in_public = value;
            });
          },
          secondary: const Icon(Icons.lightbulb_outline),
        ),
              settingTile("Account",leading_icon: Icons.account_circle)
            ],),
        ),
      ),
    );
  }

  Widget settingTile(String title, {String? subTiltle = null, IconData? leading_icon = null, IconData? trailing_icon = null}){
    return ListTile(
      title: Text(title,style: TextStyle(fontSize: 15.sp,color: AppColors.white),),
      subtitle: subTiltle == null ? null: Text(subTiltle!,style: TextStyle(fontSize: 15.sp,color: AppColors.white),),
      leading: leading_icon == null ? null: Icon(leading_icon,color: AppColors.white,size: 15.sp,),
      trailing: trailing_icon == null ? null : Icon(trailing_icon,color: AppColors.white,size: 15.sp,),
    );
  }

}
