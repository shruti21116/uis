import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:uis/bottom_Bar/History/history_screen.dart';
import 'package:uis/bottom_Bar/Home/home_screen.dart';
import 'package:uis/bottom_Bar/Notification/notification_screen.dart';
import 'package:uis/bottom_Bar/Profile/profile_screen.dart';
import 'package:uis/constant/color_helper.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  List Screen = [
    HomePage(),
    NotificationScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  int selectScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[selectScreen],
      bottomNavigationBar: Container(
        height: 78.h,
        width: 428.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(22)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(1, 1))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GNav(
              onTabChange: (value) {
                setState(() {
                  selectScreen = value;
                });
              },
              selectedIndex: selectScreen,
              tabBorderRadius: 22,
              // tabActiveBorder: Border.all(color:ColorHelper.sorange, width: 1),
              // curve: Curves.bounceIn,
              duration: Duration(milliseconds: 400),
              gap: 5,
              color: ColorHelper.sorange,
              activeColor: ColorHelper.sblue,
              iconSize: 26,
              tabBackgroundColor: ColorHelper.sblue.withOpacity(0.1),
              haptic: true,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.notifications_none,
                  text: 'notification',
                ),
                GButton(
                  icon: Icons.history,
                  text: 'History',
                ),
                GButton(
                  icon: Icons.person_outline,
                  text: 'Profile',
                )
              ]),
        ),
      ),
    );
  }
}
