import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limpio/main.dart';
import 'package:limpio/models/room.dart';
import 'package:limpio/utils/app_colors.dart';
import 'package:limpio/views/home/home_page.dart';

class PickBackground extends StatefulWidget {
  Room? room;

  PickBackground({Key? key, required this.room}) : super(key: key);

  @override
  State<PickBackground> createState() => _PickBackgroundState();
}

class _PickBackgroundState extends State<PickBackground> {
  TextEditingController nameCont = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameCont.text = widget.room!.name.toString();
  }

  List<String> backgroundNames = [
    "assets/background/background1.jpg",
    "assets/background/background1.jpg",
    "assets/background/background1.jpg",
    "assets/background/background1.jpg",
    "assets/background/background1.jpg",
    "assets/background/background1.jpg",
    "assets/background/background1.jpg",
    "assets/background/background1.jpg",
    "assets/background/background1.jpg",
    "assets/background/background1.jpg",
    "assets/background/background1.jpg",
  ];

  int selectedIndex = -1;
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
                Navigator.push(context, MaterialPageRoute(builder: (context){return HomePage();}));
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: size.width-30,
                    height: (Appheight / 20).h,
                    margin: EdgeInsets.only(left: 10, top: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextField(
                      controller: nameCont,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                      ),
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 5 / 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 3),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: backgroundNames.length,
                  itemBuilder: (context, index) {
                    var assetName = backgroundNames[index];
                    return InkWell(
                      onTap: (){
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(
                                  assetName.toString(),
                                ),
                                fit: BoxFit.cover)),
                          child:
                          selectedIndex == index?
                          Center(child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(18)),
                              padding: EdgeInsets.all(5),
                              child: Icon(Icons.check,color: AppColors.orange,))):Container(width: 0,height: 0,)
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
