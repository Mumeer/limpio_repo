
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:limpio/providers/bottom_nav_bar_provider.dart';
import 'package:limpio/views/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:limpio/views/home/home_page.dart';
import 'package:limpio/views/settings/settings_page.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final List<Widget> _pages = [
    HomePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var bottombarP = Provider.of<BottomNavBarProvider>(context);
    var bottombarP_not_listen = Provider.of<BottomNavBarProvider>(context,listen: false);
    return Scaffold(
      body: PageView(
        controller: bottombarP.controller,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        onPageChanged: (int index){
          bottombarP_not_listen.updateCurrentIndex(index);
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavBar()
    );
  }
}
