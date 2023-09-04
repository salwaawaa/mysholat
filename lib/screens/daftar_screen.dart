import 'package:flutter/material.dart';

class DaftarScreen extends StatefulWidget {
  const DaftarScreen({super.key});

  @override
  State<DaftarScreen> createState() => _DaftarScreenState();
}

class _DaftarScreenState extends State<DaftarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E2B67),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Stack(
                  children: [
                    Image.asset(
                      "assets/image/logo.png",
                      width: 250,
                      height: 250,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    "Daftar untuk melanjutkan",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(
                          fontSize: 20, // Adjusted font size
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFF),
                        ),
                      ),
                      SizedBox(height: 6),
                      Container(
                        height: 60,
                        width: 325,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Masukkan username...',
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFF),
                        ),
                      ),
                      SizedBox(height: 6),
                      Container(
                        height: 60,
                        width: 325,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Masukkan password...',
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      InkWell(
                        onTap: () {
                          // Implement your login logic here
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          alignment: Alignment.center,
                          child: Text(
                            "Daftar",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF7277C6),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DaftarScreen(),
  ));
}
