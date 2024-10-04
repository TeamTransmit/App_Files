import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:transmit/features/bot_control/controller/bot_controller.dart';

class BotControlPage extends StatefulWidget {
  const BotControlPage({super.key});

  @override
  State<BotControlPage> createState() => _BotControlPageState();
}

class _BotControlPageState extends State<BotControlPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Provider.of<BotController>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFcdc3b1),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Image.asset('assets/images/back_arrow.png')),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {},
                icon: Image.asset('assets/images/camera.png')),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_bot.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Color(0X30181818), BlendMode.darken),
          ),
        ),
        child: Column(
          children: [
            const Row(
              mainAxisSize: MainAxisSize.max,
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
            ArrowButton(
              direction: ArrowDirection.up,
              onPressed: () async {
                await controller.forward();
              },
              onPressCancelled: () async {
                await controller.off();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ArrowButton(
                    direction: ArrowDirection.left,
                    onPressed: () async {
                      await controller.left();
                    },
                    onPressCancelled: () async{
                      await controller.off();
                    },
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  ArrowButton(
                    direction: ArrowDirection.right,
                    onPressed: () async {
                      await controller.right();
                    },
                    onPressCancelled: () async {
                      await controller.off();
                    },
                  ),
                ],
              ),
            ),
            ArrowButton(
              direction: ArrowDirection.down,
              onPressed: () async {
                await controller.backward();
              },
              onPressCancelled: () async {
                await controller.off();
              },
            )
          ],
        ),
      ),
    );
  }
}

enum ArrowDirection { up, down, left, right }

class ArrowButton extends StatefulWidget {
  final ArrowDirection direction;
  final VoidCallback onPressed;
  final VoidCallback onPressCancelled;

  const ArrowButton(
      {required this.direction,
      required this.onPressed,
      required this.onPressCancelled});

  @override
  _ArrowButtonState createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    final width = (widget.direction == ArrowDirection.up ||
            widget.direction == ArrowDirection.down)
        ? 60
        : 100;
    final height = (widget.direction == ArrowDirection.up ||
            widget.direction == ArrowDirection.down)
        ? 100
        : 60;
    return GestureDetector(
      onTapDown: (_) {
        _onTapDown();
        widget.onPressed();
      },
      onLongPressStart: (_) {
        _onTapDown();
        widget.onPressed();
      },
      onLongPressEnd: (_) {
        _onTapUp();
        widget.onPressCancelled();
      },
      onTapUp: (_) {
        _onTapUp();
        widget.onPressCancelled();
      },
      onTapCancel: () {
        _onTapUp();
        widget.onPressCancelled();
      },
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: ClipPath(
          clipper: ArrowClipper(direction: widget.direction),
          child: Container(
            width: width.toDouble(),
            height: height.toDouble(),
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _onTapDown() {
    setState(() {
      _scale = 0.9; // Shrink the button
    });
  }

  void _onTapUp() {
    setState(() {
      _scale = 1.0; // Return to normal size
    });
  }
}

/*
class ArrowButton extends StatelessWidget {
  final ArrowDirection direction;
  final VoidCallback onPressed;

  ArrowButton({required this.direction, required this.onPressed});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPressed,
      child: ClipPath(
        clipper: ArrowClipper(direction: direction),
        child: Container(
          width: width.toDouble(),
          height: height.toDouble(),
          color: Color(0XFFFFB300),
        ),
      ),
    );
  }
}
*/

class ArrowClipper extends CustomClipper<Path> {
  final ArrowDirection direction;

  ArrowClipper({required this.direction});

  @override
  Path getClip(Size size) {
    Path path = Path();
    if (direction == ArrowDirection.up) {
      path.moveTo(size.width / 2, 0);
      path.lineTo(0, size.height / 3);
      path.lineTo(0, size.height);
      path.lineTo(size.width / 2, size.height * 0.7);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, size.height / 3);
    } else if (direction == ArrowDirection.down) {
      path.moveTo(0, 0); // Start at the top left
      path.lineTo(size.width / 2, size.height * 0.3);
      path.lineTo(size.width, 0); // Move across the top
      path.lineTo(size.width, size.height * 2 / 3); // Move down to 2/3 height
      path.lineTo(
          size.width / 2, size.height); // Point towards the bottom center
      path.lineTo(
          0,
          size.height *
              2 /
              3); // Move towards the left bottom part (2/3 height)
      path.lineTo(0, 0); // Close the path at the top left
    } else if (direction == ArrowDirection.left) {
      path.moveTo(size.width, 0);
      path.lineTo(size.width * 2 / 3, size.height / 2);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width / 3, size.height);
      path.lineTo(0, size.height / 2);
      path.lineTo(size.width / 3, 0);
    } else if (direction == ArrowDirection.right) {
      path.moveTo(0, 0); // Start at the top left
      path.lineTo(size.width * 2 / 3, 0); // Move to 2/3 width along the top
      path.lineTo(
          size.width, size.height / 2); // Point towards the right middle
      path.lineTo(size.width * 2 / 3,
          size.height); // Move downwards along the right side
      path.lineTo(0, size.height); // Go back to the bottom left
      path.lineTo(size.width / 3,
          size.height / 2); // Move towards the middle of the left side
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
