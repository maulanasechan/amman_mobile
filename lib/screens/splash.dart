import 'package:amman_mobile_app/screens/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Set a delay using Future.delayed
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to another screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 2, 65, 91),
              Color.fromARGB(255, 74, 183, 186),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                'assets/logo/logo_transparent.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Image.asset('assets/logo/logo_text_white.png'),
            ),
          ],
        ),
      ),
    );
  }
}
