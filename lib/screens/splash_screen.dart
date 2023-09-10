import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF3E2B67), // Latar belakang warna ungu
        body: Center(
          // Add your onPressed code here!
          child: Stack(
            children: [
              Image.asset(
                "assets/image/logo.png",
                width: 250, // Lebar gambar
                height: 250, // Tinggi gambar
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 50, bottom: 45),
          child: SizedBox(
              height: 75,
              width: 155,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/homeScreen');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8), // Add proper padding here
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: const Center(
                        child: Text(
                      "Next",
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                ),
              )),
        ));
  }
}
