import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transmit/common/constants.dart';
import 'package:transmit/features/home/home_page.dart';

import '../../common/colors.dart';

class ViIndexPage extends StatefulWidget {
  const ViIndexPage({super.key});

  @override
  State<ViIndexPage> createState() => _ViIndexPageState();
}

class _ViIndexPageState extends State<ViIndexPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                color: ColorsUtility.primary, spreadRadius: 0, blurRadius: 2),
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
          child: Image.asset(
            'assets/images/scanner.png',
            width: 25,
            height: 25,
            color: Colors.white,
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Image.asset(
              'assets/images/back_arrow.png',
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Given',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'NDVI 1',
                    style: TextStyle(
                      color: Color(0xFF1BA54C),
                      fontSize: 24,
                      fontFamily: 'Sen',
                      fontWeight: FontWeight.w700,
                      height: 0.06,
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: size.width - 30,
                    child: const Text(
                      "we’re looking at a landscape that’s holding its ground but isn't quite thriving. This indicates moderate vegetation health—there's some green out there, but it’s not robust. It suggests the presence of plant life, but perhaps the soil moisture isn’t at optimal levels, signaling that the environment may need a boost. We have an opportunity to innovate and optimize resources for better growth.\n\nAn NDVI Index value of +1 represents the pinnacle of success in vegetation. We’re talking about a flourishing ecosystem, where plants are thriving, soaking up sunlight, and utilizing water efficiently. This is a green revolution, showcasing nature’s ability to provide and sustain life.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF555555),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 100,
              child: Image.asset(
                'assets/images/spinner.jpeg',
                width: size.width,
                fit: BoxFit.fitWidth,
              ))
        ],
      ),
    );
  }
}
