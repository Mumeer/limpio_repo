import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:limpio/utils/app_colors.dart';
import 'package:limpio/views/add_task/activities.dart';
import 'package:limpio/views/home/home_page.dart';

class ChoseFromList extends StatefulWidget {
  const ChoseFromList({Key? key}) : super(key: key);

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
        title: Text("Home"),
        backgroundColor: AppColors.background,
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
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
              )),
          SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: AppColors.background,
      body: SizedBox.expand(
        child: ListView.builder(
            itemCount: nameList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Activities();
                  }));
                },
                title: Text(nameList[index]),
                trailing: Icon(Icons.arrow_forward_ios),
              );
            }),
      ),
    );
  }
}
