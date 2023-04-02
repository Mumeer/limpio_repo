import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limpio/main.dart';
import 'package:limpio/utils/app_colors.dart';

class CreateRoom extends StatefulWidget {
  const CreateRoom({Key? key}) : super(key: key);

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.background,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        elevation: 0,
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Text("Ambienti")),
        automaticallyImplyLeading: false,
        title: Text("CASSA GIALLI"),
        backgroundColor: AppColors.background,
        centerTitle: true,),
      backgroundColor: AppColors.background,
      body: SizedBox.expand(
        child: Column(
          children: [
            Container(
                width: size.width-30,
                height: (Appheight / 20).h,
                margin: EdgeInsets.only(left: 10, top: 10,right: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.blackGray,
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.blackGray,
                      border: InputBorder.none,
                      hintText: "Create Room"
                  ),
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              TextButton(
                  style: TextButton.styleFrom(backgroundColor: AppColors.secondary),
                  onPressed: (){}, child: Text("Create New",style: TextStyle(color: AppColors.white),)),
                SizedBox(width: 15,)
            ],)
  ],
        ),
      ),
    );
  }
}
