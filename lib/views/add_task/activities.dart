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
  List<String> activityNameTemplate = ["Pulwari lavello", "Lavare Pavimento"];
  List<String> activityName = [
    "Pulwari lavello",
    "Pulwari lavello",
    "Pulwari lavello",
    "Pulwari lavello",
    "Pulwari lavello",
    "Pulwari lavello",
    "Pulwari lavello",
    "Pulwari lavello",
    "Pulwari lavello",
    "Pulwari lavello",
    "Pulwari lavello",
    "Pulwari lavello",
    "Lavare Pavimento"
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
              SizedBox(
                height: 10,
              ),
              Text("Ativita da fare"),
              SizedBox(
                height: 10,
              ),
              Container(
                height: (Appheight / 6).h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: activityNameTemplate.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onLongPress: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EditActivities();
                          }));
                        },
                        child: Wrap(
                          children: [
                            Container(
                                height: (Appheight / 7).h,
                                width: (Appwidth / 3.4).w,
                                decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      activityNameTemplate[index][0],
                                      style: TextStyle(fontSize: 35.sp),
                                    ),
                                    SizedBox(height: 3,),
                                    Text(activityNameTemplate[index]),
                                    SizedBox(height: 5,),
                                  ],
                                )),
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Elenco ativita"),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8),
                    itemCount: activityName.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: (Appwidth / 3).w,
                        height: (Appheight / 6).h,
                        decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(child: Text(activityName[index])),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(top: 7),
        child: Row(
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
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20,
                        )),
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
                  child: Icon(
                    Icons.add,
                    color: AppColors.white,
                  )),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
