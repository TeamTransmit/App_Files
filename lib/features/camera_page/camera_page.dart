import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      cameras[0],
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    const bottomNavHeight = 80.0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.flash_on),
            onPressed: () {
              // Toggle flash
            },
          ),
          IconButton(
            icon: Icon(Icons.flash_off),
            onPressed: () {
              // Toggle flash
            },
          ),
        ],
      ),
      body:  Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Center(
            child: Stack(
              children: [
                // Dark overlay with a clear hole in the center
                Positioned(
                  top: 0,
                  bottom: 70, // Limit overlay up to the bottom nav
                  left: 0,
                  right: 0,
                  child: ClipPath(
                    clipper: HoleClipper(), // Custom clipper to make the hole
                    child: Container(
                      color: Colors.black.withOpacity(0.7), // Black overlay
                    ),
                  ),
                ),
                // Clear box with a white border in the center
                Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.switch_camera),
            onPressed: () {
              // Switch camera
            },
          ),
          Container(
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
              onPressed: () async {
                try {
                  await _initializeControllerFuture;
                  final image = await _controller.takePicture();
                  // Save or display the image
                } catch (e) {
                  print(e);
                }
              },
              backgroundColor: Colors.transparent,
              // Make background transparent to show gradient
              elevation: 0,
              // Remove shadow if not needed
              child: const Icon(Icons.camera_alt_outlined, color: Colors.white,),

            ),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Open settings
            },
          ),
        ],
      ),
    );
  }
}

class HoleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Define the size and position of the clear box in the center
    double boxWidth = 200;
    double boxHeight = 200;
    double centerX = (size.width - boxWidth) / 2;
    double centerY = 253;

    Path path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height)) // Full screen
      ..addRect(Rect.fromLTWH(centerX, centerY, boxWidth, boxHeight)) // Clear box
      ..fillType = PathFillType.evenOdd; // Create a "hole" effect

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
