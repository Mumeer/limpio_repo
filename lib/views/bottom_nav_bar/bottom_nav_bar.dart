
import 'package:flutter/material.dart';
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
    return  BottomNavigationBar(
      currentIndex: Provider.of<BottomNavBarProvider>(context).currentIndex,
      onTap: (index) {
        Provider.of<BottomNavBarProvider>(context, listen: false)
            .updateCurrentIndex(index);
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Settings'),
      ],
    );
  }
}
