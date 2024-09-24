

import 'package:bachelar_hostel/controller/getxcontroller/Splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {

  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(backgroundColor: const  Color(0xffFFFFFF),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/Bachelor_Hostel_logo.png",)
          ],
        ),
      ),
    );
  }
}
