import 'package:flutter/material.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
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
            padding: const EdgeInsets.all(17.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Center(
                  child: Image.asset(
                    "assets/image/logo.png",
                    width: 250,
                    height: 250,
                  ),
                ),
                const SizedBox(height: 16.0), // Add spacing
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    "Atur ulang kata sandi",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 65,
                      height: 59,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      // Add content for the first container
                    ),
                    const SizedBox(width: 20), // Add spacing between containers
                    Container(
                      width: 65,
                      height: 59,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      // Add content for the second container
                    ),
                    const SizedBox(width: 20), // Add spacing between containers
                    Container(
                      width: 65,
                      height: 59,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      // Add content for the third container
                    ),
                    const SizedBox(width: 20), // Add spacing between containers
                    Container(
                      width: 65,
                      height: 59,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      // Add content for the fourth container
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/newpassword');
                    // Handle "Atur ulang kata sandi" tap
                  },
                  child: Container(
                    width: 295,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    alignment: Alignment.center,
                    child: const Text("Atur ulang kata sandi",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 15, 16, 20),
                        )),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/loginScreen');
                    // Handle "Atur ulang kata sandi" tap
                  },
                  child: Container(
                    width: 295,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    alignment: Alignment.center,
                    child: const Text("Kembali untuk Masuk",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7278C6),
                        )),
                  ),
                ),
                const SizedBox(height: 10), // Add spacing between texts
                const Text(
                  "Tidak menerima email? Klik untuk mengirim ulang",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                // Add more widgets/components here
              ],
            ),
          ),
        ),
      ),
    );
  }
}
