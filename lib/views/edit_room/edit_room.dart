import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limpio/main.dart';
import 'package:limpio/models/room.dart';
import 'package:limpio/utils/app_colors.dart';
import 'package:limpio/views/edit_room/pick_background.dart';

class EditRoom extends StatefulWidget {
  Room? room;

  EditRoom({Key? key, required this.room}) : super(key: key);

  @override
  State<EditRoom> createState() => _EditRoomState();
}

class _EditRoomState extends State<EditRoom> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   systemOverlayStyle: SystemUiOverlayStyle(
        //     statusBarColor: AppColors.background,
        //     statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        //     statusBarBrightness: Brightness.light, // For iOS (dark icons)
        //   ),
        //   elevation: 0,
        //   automaticallyImplyLeading: false,
        //   title: Text(
        //     "impostazioni lougo",
        //     style: TextStyle(fontSize: 14),
        //   ),
        //   leading: Row(
        //     mainAxisSize: MainAxisSize.min,
        //     // direction: Axis.horizontal,
        //     children: [
        //       Icon(
        //         Icons.arrow_left,
        //         color: AppColors.white,
        //       ),
        //       Text(
        //         "Cerca",
        //         style: TextStyle(color: AppColors.white, fontSize: 12),
        //       ),
        //     ],
        //   ),
        //   backgroundColor: AppColors.background,
        //   centerTitle: true,
        //   actions: [
        //     InkWell(
        //         onTap: () {},
        //         child: Center(
        //           child: Wrap(
        //             crossAxisAlignment: WrapCrossAlignment.center,
        //             children: [
        //               Text("fine"),
        //             ],
        //           ),
        //         )),
        //     SizedBox(
        //       width: 10,
        //     )
        //   ],
        // ),
        backgroundColor: AppColors.background,
        body: SizedBox.expand(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(   children: [
                    Icon(
                      Icons.arrow_left,
                      color: AppColors.white,
                    ),
                    Text(
                      "Cerca",
                      style: TextStyle(color: AppColors.white, fontSize: 12),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      width: size.width,
                      child: Center(
                        child: Text(
                          "impostazioni lougo",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children:[ InkWell(
                          onTap: () {},
                          child: Center(
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Text("fine"),
                              ],
                            ),
                          )),
                        SizedBox(
                          width: 10,
                        )
                      ]
                    ),
                  ],
                ),
                roomToEdit(widget.room!),
                Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red.shade400),
                  width: Appwidth.w,
                  height: 40.h,
                  child: Center(child: Text("Esci da questa lista")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget roomToEdit(Room room) {
    return Container(
      margin: EdgeInsets.all(20),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: (Appwidth / 2).w,
                  height: (Appheight / 20).h,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    room.name.toString(),
                    style: TextStyle(color: Colors.black),
                  )),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return PickBackground(room: room);
                  }));
                },
                child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: Icon(
                      Icons.edit,
                      size: 20,
                      color: AppColors.white,
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
