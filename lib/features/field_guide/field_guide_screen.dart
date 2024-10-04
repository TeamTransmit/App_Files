import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transmit/common/colors.dart';
import 'package:transmit/common/constants.dart';
import 'package:transmit/common/sub_category_widget.dart';
import 'package:transmit/features/home/home_page.dart';
import 'package:transmit/features/vi_index_page/vi_index_page.dart';

import '../water_report/water_report_page.dart';

class FieldGuideScreen extends StatefulWidget {
  const FieldGuideScreen({super.key});

  @override
  State<FieldGuideScreen> createState() => _AgriScanScreenState();
}

class _AgriScanScreenState extends State<FieldGuideScreen> {
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
          'Field Guide',
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
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                            const WaterReportPage()),
                      );
                    },
                    child: SubCategoryWidget(
                      size: size,
                      text: 'Water Availability',
                      image: 'assets/images/water.png',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                            const ViIndexPage()),
                      );
                    },
                    child: SubCategoryWidget(
                      size: size,
                      text: 'Soil Health Monitoring',
                      image: 'assets/images/soil_health.png',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SubCategoryWidget(
                    size: size,
                    text: 'Weather Monitoring',
                    image: 'assets/images/weather_data.png',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Image.asset(
                'assets/images/field_guide.png',
                width: size.width,
                fit: BoxFit.fitWidth,
              ))
        ],
      ),
    );
  }
}
