import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: 'Masukkan Email',
      // Add a clear button to the search bar
      suffixIcon: IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => _searchController.clear(),
      ),
      // Add a search icon or button to the search bar
      prefixIcon: IconButton(
        icon: const Icon(Icons.email),
        onPressed: () {
          // Perform the search here
        },
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF3E2B67),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: const Color(0xFF3E2B67),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, '/loginScreen');
            },
            iconSize: 45,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(17.0),
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
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    "lupa kata sandi",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ), // Add spacing between text and input field
                TextFormField(
                  controller: _searchController,
                  decoration: inputDecoration,
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/resetScreen');
                    // Handle "Atur ulang kata sandi" tap
                  }, // Add spacing between input field and button
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
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/loginScreen');
                    // Handle "Atur ulang kata sandi" tap
                  }, // Add spacing between the two text containers
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
                    child: Text("Kembali untuk masuk ",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7278C6),
                        )),
                  ),
                ),
                SizedBox(
                  height: 7,
                ), // Add spacing before the "Belum punya akun? Daftar" text
                Text(
                  "Belum punya akun? Daftar",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
