
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:limpio/providers/user_provider.dart';
import 'package:limpio/utils/app_colors.dart';
import 'package:limpio/utils/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              Text("HomePage",style: TextStyle(color: AppColors.white,fontSize: 18.sp),),
            ],),
        ),
      ),
    );
  }
}
