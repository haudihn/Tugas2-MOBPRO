import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delay 2 detik sebelum masuk ke HomeScreen
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          //  Background Lottie
          Lottie.asset(
            'assets/lottie/bg_splash.json', 
            fit: BoxFit.cover, 
            repeat: true,
          ),

          //  logo finance di tengah layar
          Center(
            child: Lottie.asset(
              'assets/lottie/Finance.json', 
              width: 220,
              height: 220,
              fit: BoxFit.contain,
            ),
          ),

          //  teks di bagian bawah layar
          const Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: Text(
              'Great Banking Experience\nFor Everyone',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
