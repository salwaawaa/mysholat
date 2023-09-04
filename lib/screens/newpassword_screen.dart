import 'package:flutter/material.dart';

class Newpassword extends StatefulWidget {
  const Newpassword({super.key});

  @override
  State<Newpassword> createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E2B67),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, '/loginScreen');
          },
          iconSize: 30,
        ),
        backgroundColor: Colors.transparent, // Make the app bar transparent
        elevation: 0, // Remove the shadow
      ),
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
                    "Tetapkan kata sandi baru!",
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
                        "kata sandi baru ",
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
                          hintText: 'Masukkan kata sandi Anda',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "konfirmasi kata sandi",
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
                          hintText: 'Masukkan kata sandi Anda',
                        ),
                      ),

                      const SizedBox(height: 12), // Add spacing
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/homeScreen');
                          // Implement your login logic here
                        },
                        child: Container(
                          width: 295,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          alignment: Alignment.center,
                          child: Text("Atur ulang kata sandi",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 15, 16, 20),
                              )),
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
