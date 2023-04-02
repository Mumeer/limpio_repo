import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limpio/main.dart';
import 'package:limpio/utils/app_colors.dart';
import 'package:limpio/views/add_task/activities.dart';
import 'package:limpio/views/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:limpio/views/create_room/create_room.dart';
import 'package:limpio/views/home/home_page.dart';

class ChoseFromList extends StatefulWidget {
  String roomName;
  ChoseFromList({Key? key,required this.roomName}) : super(key: key);

  @override
  State<ChoseFromList> createState() => _ChoseFromListState();
}

class _ChoseFromListState extends State<ChoseFromList> {
  List<String> nameList = [
    "Cucino",
    "Bango",
    "Bango ospiti",
    "Ingresso",
    "Ingresso",
    "Ingresso",
    "Ingresso",
    "Ingresso",
    "Ingresso",
    "Ingresso",
    "Ingresso",
    "Ingresso",
  ];

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
        automaticallyImplyLeading: false,
        title: Text(widget.roomName),
        backgroundColor: AppColors.background,
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 3,),
              Text("luoghi",style: TextStyle(color: AppColors.white),),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.background,
      body: SizedBox.expand(
        child: ListView.builder(
            itemCount: nameList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Activities();
                  }));
                },
                title: Text(nameList[index]),
                trailing: Icon(Icons.arrow_forward_ios,color: AppColors.white,size: 15,),
              );
            }),
      ),
      bottomSheet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
                height: 40,
                margin: EdgeInsets.only(left: 10, right: 10),
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(7)),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.white,
                      border: InputBorder.none,
                      hintText: "cerca ambiente...",
                  prefixIcon: Icon(Icons.search,size: 20,)),
                  style: TextStyle(color: Colors.black),
                )),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return CreateRoom();
              }));
            },
            child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: AppColors.indigo1,
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(Icons.add,color: AppColors.white,)),
          ),
          SizedBox(width: 10,)
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
