import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transmit/common/colors.dart';
import 'package:transmit/common/constants.dart';
import 'package:transmit/common/sub_category_widget.dart';
import 'package:transmit/features/bot_control/bot_control_page.dart';
import 'package:transmit/features/bot_control/controller/bot_controller.dart';
import 'package:transmit/features/camera_page/camera_page.dart';
import 'package:transmit/features/home/home_page.dart';

class AgriScanScreen extends StatefulWidget {
  const AgriScanScreen({super.key});

  @override
  State<AgriScanScreen> createState() => _AgriScanScreenState();
}

class _AgriScanScreenState extends State<AgriScanScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(

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
          child: Image.asset('assets/images/scanner.png', width: 25, height: 25, color: Colors.white,),

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
            onTap: (index) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomePage(index)),
              );
            },
            type: BottomNavigationBarType.fixed,
            items: Constants().navBarsItems(),
            currentIndex: 2,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Image.asset('assets/images/back_arrow.png'),
          ),
        ),
        title: const Text(
          'Agri Scan',
          style: TextStyle(
            color: ColorsUtility.primary,
            fontWeight: FontWeight.w800,
            fontSize: 24,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: size.width * 0.3,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ChangeNotifierProvider(
                                        create: (context) => BotController(),
                                        child: const BotControlPage(),
                                      ),
                                    ),
                                  );
                    },
                    child: SubCategoryWidget(
                      size: size,
                      text: 'Pest Identification',
                      image: 'assets/images/pest_identification.png',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      CameraPage(),
                                    ),
                                  );
                    },
                    child: SubCategoryWidget(
                      size: size,
                      text: 'Disease Detection',
                      image: 'assets/images/disease_detection.png',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Image.asset(
                'assets/images/farmers.png',
                width: size.width,
                fit: BoxFit.fitWidth,
              ))
        ],
      ),
    );
  }
}
