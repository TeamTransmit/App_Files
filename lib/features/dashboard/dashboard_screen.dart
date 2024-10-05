import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:transmit/common/colors.dart';
import 'package:transmit/features/agri_scan/agri_scan_screen.dart';
import 'package:transmit/features/bot_control/bot_control_page.dart';
import 'package:transmit/features/bot_control/controller/bot_controller.dart';
import 'package:transmit/features/field_guide/field_guide_screen.dart';
import 'package:transmit/features/vi_index_page/vi_index_page.dart';
import 'package:transmit/features/water_report/water_report_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Container(),
        title: Image.asset(
          "assets/images/logo_transmit.png",
          width: 120,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      height: 200,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(
                          'assets/images/weather_image2.jpeg',
                        ),
                        colorFilter: ColorFilter.mode(
                            Color(0X60181818), BlendMode.darken),
                        fit: BoxFit.fill,
                      )),
                    )),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        const Text("Today’s Weather",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Partly Cloudy",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                        const SizedBox(
                          height: 13,
                        ),
                        const Row(
                          children: [
                            Icon(
                              CupertinoIcons.location_solid,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Kuril, Dhaka",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text("26",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                            const SizedBox(
                              width: 2,
                            ),
                            const Text("°C",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontFeatures: [
                                    FontFeature.enable('sups'),
                                  ],
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              'assets/images/caret-up.png',
                              width: 20,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text("34°C",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                )),
                            const SizedBox(
                              width: 11,
                            ),
                            Image.asset(
                              'assets/images/caret-down.png',
                              width: 20,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text("20°C",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                )),
                            const SizedBox(
                              width: 11,
                            ),
                            const Text("Feels like  22°C",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              width: size.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text("Manage your fields",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffA54F08),
                      )),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  /*Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ViIndexPage()),
                                  );*/
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AgriScanScreen(),
                                    ),
                                  );
                                },
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            left: 20,
                                            right: 20,
                                            bottom: 8),
                                        child: Image.asset(
                                          fit: BoxFit.fill,
                                          'assets/images/image_1.png',
                                          width: 90,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text("Agri Scan",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: ColorsUtility.primary)),
                                      const SizedBox(
                                        height: 15,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const WaterReportPage()),
                                  );
                                },
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            left: 20,
                                            right: 20,
                                            bottom: 8),
                                        child: Image.asset(
                                          'assets/images/image_2.png',
                                          fit: BoxFit.fitWidth,
                                          width: 90,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text("Crop Care",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: ColorsUtility.primary,
                                          )),
                                      const SizedBox(
                                        height: 15,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const FieldGuideScreen()),
                                  );
                                },
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            left: 20,
                                            right: 20,
                                            bottom: 8),
                                        child: Image.asset(
                                          'assets/images/image_3.png',
                                          width: 90,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text("Field Guide",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: ColorsUtility.primary,
                                          )),
                                      const SizedBox(
                                        height: 15,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            left: 20,
                                            right: 20,
                                            bottom: 8),
                                        child: Image.asset(
                                          'assets/images/image_4.png',
                                          width: 90,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text("Farmer AI",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: ColorsUtility.primary,
                                          )),
                                      const SizedBox(
                                        height: 15,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     InkWell(
                          //       onTap: () {
                          //         Navigator.of(context).push(
                          //           MaterialPageRoute(
                          //             builder: (context) =>
                          //                 ChangeNotifierProvider(
                          //               create: (context) => BotController(),
                          //               child: const BotControlPage(),
                          //             ),
                          //           ),
                          //         );
                          //       },
                          //       child: Card(
                          //         child: Column(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             Padding(
                          //               padding: const EdgeInsets.only(
                          //                   top: 20,
                          //                   left: 20,
                          //                   right: 20,
                          //                   bottom: 8),
                          //               child: Image.asset(
                          //                 'assets/images/image_3.png',
                          //                 width: 90,
                          //               ),
                          //             ),
                          //             const SizedBox(
                          //               height: 5,
                          //             ),
                          //             const Text("Bot Control",
                          //                 style: TextStyle(
                          //                   fontSize: 14,
                          //                   fontWeight: FontWeight.w600,
                          //                 )),
                          //             const SizedBox(
                          //               height: 15,
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
