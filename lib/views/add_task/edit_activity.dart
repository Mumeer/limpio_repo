
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limpio/main.dart';
import 'package:limpio/utils/app_colors.dart';
import 'package:limpio/views/home/home_page.dart';

class EditActivities extends StatefulWidget {
  const EditActivities({Key? key}) : super(key: key);

  @override
  State<EditActivities> createState() => _EditActivitiesState();
}

class _EditActivitiesState extends State<EditActivities> {
  String _selectedItem = "Repitions";
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
        title: Text("Home"),
        backgroundColor: AppColors.background,
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return HomePage();
              }));
            },
            child: Center(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text("fine"),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: AppColors.background,
      body: SizedBox.expand(
        child: Column(
          children: [
            Text("Pulire lavello"),
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
                    hintText: "Pulire lavello"
                  ),
                  style: TextStyle(color: Colors.black),
                )),
            Container(
                width: size.width-30,
                margin: EdgeInsets.only(left: 10, top: 10,right: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.blackGray,
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  maxLines: 4,
                  // expands: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.blackGray,
                      border: InputBorder.none,
                      hintText: "description"
                  ),
                  style: TextStyle(color: Colors.black),
                )),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10,right: 10),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text("Ripetizione"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10,right: 10),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      style: TextStyle(color: Colors.white),
                      isExpanded: true,
                      value: _selectedItem,
                      items: <String>['Repitions', 'Repitions1', 'Repitions2', 'Repitions3']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,style: TextStyle(color: AppColors.black),),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
