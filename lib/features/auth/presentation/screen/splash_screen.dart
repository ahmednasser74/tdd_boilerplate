import 'package:boilerplate/features/auth/presentation/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset('assets/lottie/splash_lottie.json'),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/toast_icon.png',
              width: 100,
            ),
          ),
          Positioned(
            bottom: 70,
            left: MediaQuery.of(context).size.width / 4.5,
            child: Text(
              'Chat from any where \nwith anyone...',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ],
      ),
    );
  }
}
