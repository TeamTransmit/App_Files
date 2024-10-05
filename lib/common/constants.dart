import 'package:flutter/cupertino.dart';

class Constants {
  List<BottomNavigationBarItem> navBarsItems() {
    return [
      BottomNavigationBarItem(

          activeIcon: Image.asset(
            'assets/images/home_selected.png',
            height: 24,
            width: 24,
          ),
          icon: Image.asset(
            'assets/images/home.png',
            height: 24,
            width: 24,
          ),
          label: ''
      ),
      BottomNavigationBarItem(
          activeIcon: Image.asset(
            'assets/images/weather_selected.png',
            height: 24,
            width: 24,
          ),
          icon: Image.asset(
            'assets/images/weather.png',
            height: 24,
            width: 24,
          ),
          label: ''
      ),
      // const BottomNavigationBarItem(
      //   icon: Icon(
      //     Icons.qr_code,
      //     color: Colors.white,
      //   ),
      // ),
      BottomNavigationBarItem(

          icon: Container(),
          label: ''
      ),
      BottomNavigationBarItem(
          activeIcon: Image.asset(
            'assets/images/notification_selected.png',
            height: 24,
            width: 24,
          ),
          icon: Image.asset(
            'assets/images/notification.png',
            height: 24,
            width: 24,
          ),
          label: ''
      ),
      BottomNavigationBarItem(
          activeIcon: Image.asset(
            'assets/images/settings_selected.png',
            height: 24,
            width: 24,
          ),
          icon: Image.asset(
            'assets/images/settings.png',
            height: 24,
            width: 24,
          ),
          label: ''
      ),
    ];
  }
}