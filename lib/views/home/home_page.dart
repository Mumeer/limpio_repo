
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limpio/main.dart';
import 'package:limpio/models/room.dart';
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
              child: Wrap(
                children: [
                  Text("Add"),
                  Icon(Icons.add),
                ],
              ))
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
             showRoom(Room(name: "abc",bacgroundImage: "assets/background/background1.jpg"))
            ],),
        ),
      ),
    );
  }

  Widget showRoom(Room room){
    return Container(
      margin: EdgeInsets.all(20),
      width: Appwidth.w,
      height: Appheight.h/5,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
      image: DecorationImage(image: AssetImage(room.bacgroundImage.toString(),),fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10,top: 10),
                padding:EdgeInsets.all(10),
                  color: AppColors.white,
                  child: Text(room.name.toString(),style: TextStyle(color: Colors.black),)),
            ],
          ),
        ],
      ),);
  }
}
