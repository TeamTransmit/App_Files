import 'package:flutter/material.dart';
import 'package:transmit/common/colors.dart';
import 'package:transmit/common/constants.dart';
import 'package:transmit/features/home/home_page.dart';

class WaterReportPage extends StatefulWidget {
  const WaterReportPage({super.key});

  @override
  State<WaterReportPage> createState() => _WaterReportPageState();
}

class _WaterReportPageState extends State<WaterReportPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: ColorsUtility.primary, spreadRadius: 0, blurRadius: 2),
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
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Image.asset('assets/images/back_arrow.png')),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      children: [
                        TextSpan(text: 'ET Level for Local: '),
                        TextSpan(
                          text: '5 mm/day',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      children: [
                        TextSpan(text: 'ET Level for Rice: '),
                        TextSpan(
                          text: '25 mm/day',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      children: [
                        TextSpan(text: 'Water: '),
                        TextSpan(
                          text: '2.3225 Liters',
                          style: TextStyle(
                              color: Color(0xffA54F08),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/farmer.png'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Positioned(
                      bottom: 130,
                      left: 0,
                      child: Text(
                        "Field Data:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                  const Positioned(
                    bottom: 100,
                    left: 0,

                    child: Text(
                      '300m.l/sq.ft/day',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                   Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.65,
                          child: const Text(
                            'For rice plants in the early stage, you need to supply 2 liters of water per square foot per day to maintain optimal growth.',
                            style: TextStyle(
                              color: Color(0xFF47484C),
                              fontSize: 14,
                              // fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Image.asset('assets/images/wheat.png'),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10,),
              const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Water Needed:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "2 liters/sq. ft./day",
                    style: TextStyle(
                      color: Color(0xffA54F08),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
