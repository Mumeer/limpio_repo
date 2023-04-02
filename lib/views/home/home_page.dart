import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limpio/main.dart';
import 'package:limpio/models/room.dart';
import 'package:limpio/views/add_task/activities.dart';
import 'package:limpio/views/add_task/chose_from_list.dart';
import 'package:limpio/views/edit_room/edit_room.dart';
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
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.background,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text("i miei luoghi",style: TextStyle(fontSize: 14),),
        backgroundColor: AppColors.background,
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                setState(() {
                  showEdit = !showEdit;
                });
              },
              child: Center(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(showEdit ? "fine" : "modifica"),
                  ],
                ),
              )),
          SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: AppColors.background,
      body: SizedBox.expand(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              showRoom(Room(
                  name: "CASA GIALLA",
                  bacgroundImage: "assets/background/background1.jpg")),
              showRoom(Room(
                  name: "CASA GIALLA",
                  bacgroundImage: "assets/background/background1.jpg")),
              showRoom(Room(
                  name: "CASA GIALLA",
                  bacgroundImage: "assets/background/background1.jpg")),
              showRoom(Room(
                  name: "CASA GIALLA",
                  bacgroundImage: "assets/background/background1.jpg")),
              showRoom(Room(
                  name: "CASA GIALLA",
                  bacgroundImage: "assets/background/background1.jpg")),
              showRoom(Room(
                  name: "CASA GIALLA",
                  bacgroundImage: "assets/background/background1.jpg")),
              showRoom(Room(
                  name: "CASA GIALLA",
                  bacgroundImage: "assets/background/background1.jpg")),
            ],
          ),
        ),
      ),
    );
  }

  bool showEdit = false;

  Widget showRoom(Room room) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ChoseFromList(roomName: room.name.toString(),);
        }));
      },
      child: Container(
        margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
        width: Appwidth.w,
        height: Appheight.h / 5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: AssetImage(
                  room.bacgroundImage.toString(),
                ),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      room.name.toString(),
                      style: TextStyle(color: Colors.black),
                    )),
                if (showEdit)
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return EditRoom(
                          room: room,
                        );
                      }));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Icon(
                        Icons.settings_outlined,
                        color: AppColors.white,
                        size: 30,
                      ),
                    ),
                  ),
              ],
            ),
            if (showEdit)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Icon(Icons.list,size: 45,color: AppColors.white,),
                SizedBox(width: 20,),
            ],)
          ],
        ),
      ),
    );
  }
}
