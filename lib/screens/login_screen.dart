import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    "Masuk untuk melanjutkan!",
                    style: TextStyle(
                      fontSize: 25,
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
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFF),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Masukkan username...',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFF),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Masukkan password...',
                        ),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/forgotScreen');
                            // Implement your password recovery logic here
                          },
                           child: Text(
                            "Lupa password?",
                            style: TextStyle(
                              fontSize: 15,
                              
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                     const SizedBox(height: 12), // Add spacing
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/homeScreen');
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
                            "Masuk",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF7277C6),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25), // Adjust spacing
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Adjust alignment
                        children: [
                          Container(
                            width: 84,
                            height: 67,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 25), // Adjust spacing
                          Container(
                            width: 84,
                            height: 67,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 25), // Adjust spacing
                          Container(
                            width: 84,
                            height: 67,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                          ),
                        ],
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
