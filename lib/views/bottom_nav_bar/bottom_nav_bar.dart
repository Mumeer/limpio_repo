
import 'package:flutter/material.dart';
import 'package:limpio/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:limpio/providers/bottom_nav_bar_provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              children: [
                Icon(Icons.person,color: Colors.white,),
                Text( "Profile",style: TextStyle(color: AppColors.white),)
              ],
            ),
            SizedBox(width: 40,)
          ],
        ),
      );
    //   BottomNavigationBar(
    //   backgroundColor: AppColors.black,
    //   currentIndex: Provider.of<BottomNavBarProvider>(context).currentIndex,
    //   onTap: (index) {
    //     Provider.of<BottomNavBarProvider>(context, listen: false)
    //         .updateCurrentIndex(index);
    //   },
    //   items: [
    //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    //     BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.white,), label: 'Profile',),
    //   ],
    // );
  }
}
