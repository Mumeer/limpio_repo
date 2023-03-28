


import 'package:flutter/cupertino.dart';

class BottomNavBarProvider with ChangeNotifier{
  int _currentIndex = 0;
  PageController controller = PageController(initialPage: 0);

  int get currentIndex => _currentIndex;

  void updateCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

}