import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsScreen extends StatelessWidget {
  final String text;

  const SettingsScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(),
        title: Image.asset(
          "assets/images/logo_transmit.png",
          width: 120,
        ),
      ),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                      text,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
              SizedBox(height: 10,),
              const Text('In Development')
            ],
          )),
    );
  }
}
