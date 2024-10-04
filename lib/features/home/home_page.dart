import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transmit/common/constants.dart';
import 'package:transmit/features/dashboard/dashboard_screen.dart';
import 'package:transmit/settings/settings_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomePage extends ConsumerStatefulWidget {
  final currentIndex;

  const HomePage(this.currentIndex, {super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int currentIndex = 0;
  late PersistentTabController controller;

  @override
  void initState() {
    currentIndex = widget.currentIndex;
    controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  onIndexUpdate(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> _screens = [
    const DashboardScreen(),
    const SettingsScreen(text: "Plant Growth"),
    const SettingsScreen(text: "Reports"),
    const SettingsScreen(text: "Settings"),
    const SettingsScreen(text: "Settings"),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black, // Status bar color
    ));

    return Theme(
      data: ThemeData(
        primaryColor: const Color(0XFF49C263),
      ),
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0XFF49C263), Color(0XFF1BA54C)],
              // Define your gradient colors here
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: FloatingActionButton(
            onPressed: () {
              // Handle button press
            },
            backgroundColor: Colors.transparent,
            // Make background transparent to show gradient
            elevation: 0,
            // Remove shadow if not needed
            child: const Icon(
              Icons.qr_code,
              color: Colors.white,
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              // BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              items: Constants().navBarsItems(),
              onTap: (index) {
                onIndexUpdate(index);
              },
              type: BottomNavigationBarType.fixed,
            ),
          ),
        ),
        body: _screens[currentIndex],
      ),
    );
  }
}
