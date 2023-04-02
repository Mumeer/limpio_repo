
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limpio/main.dart';
import 'package:limpio/utils/app_colors.dart';
import 'package:limpio/views/add_task/edit_activity.dart';
import 'package:limpio/views/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:limpio/views/create_room/create_room.dart';

class Activities extends StatefulWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {

  List<String> activityNameTemplate = ["Pulwari lavello","Lavare Pavimento"];
  List<String> activityName = ["Pulwari lavello","Lavare Pavimento"];

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
        title: Text("CASA GIALLA"),
        backgroundColor: AppColors.background,
        centerTitle: true,
        actions: [
          Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text("fine"),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: AppColors.background,
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Text("Ativita da fare"),
              SizedBox(height: 10,),
              Container(

                height: (Appheight/6).h,
                child: ListView.builder(
                    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,
                    //     childAspectRatio: 5/3,
                    //   mainAxisSpacing: 8
                    // ),
                    scrollDirection: Axis.horizontal,
                    itemCount: activityNameTemplate.length,
                    itemBuilder: (context, index){
                  return InkWell(
                    onLongPress: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return EditActivities();
                      }));
                    },
                    child: Wrap(
                      children: [
                        Container(
                            height: (Appheight/6).h,

                            width: (Appwidth/3).w,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(child: Text(activityNameTemplate[index]))),
                        SizedBox(width: 10,),
                      ],
                    ),
                  );
                }),
              ),
              SizedBox(height: 10,),
              Text("Elenco ativita"),
              SizedBox(height: 10,),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                  childAspectRatio: 1,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8
                  ),
                    itemCount: activityName.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: (Appwidth/3).w,
                        height: (Appheight/6).h,
                        decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Text(activityName[index])),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
        child: Row(
          children: [
            Expanded(child: Container(
                height: (Appheight / 20).h,
                margin: EdgeInsets.only(left: 10, top: 10,right: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.white,
                      border: InputBorder.none,
                      hintText: "Pulire lavello"
                  ),
                  style: TextStyle(color: Colors.black),
                )),),
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){return CreateRoom();}));
              },
              child: Container(
                padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Icon(Icons.add)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}