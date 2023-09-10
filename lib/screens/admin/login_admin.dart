import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mysholat/screens/admin/notes_screen.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({Key? key}) : super(key: key);

  @override
  _LoginAdminState createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();

      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        // If login is successful, navigate to the next screen (e.g., NotesScreen).
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              NotesScreen(), // Replace with your destination screen
        ));
      } else {
        // Handle empty email or password error
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Please enter both email and password.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // Handle login failure
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Login failed. Please check your credentials.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E2B67),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Image.asset(
                  "assets/image/logo.png",
                  width: 250,
                  height: 250,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Masukan username anda...',
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Masukan password anda...',
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
                const SizedBox(height: 12), // Add spacing
                InkWell(
                  onTap: () {
                    _signInWithEmailAndPassword();
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    child: const Text(
                      "Masuk",
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
        ),
      ),
    );
  }
}
