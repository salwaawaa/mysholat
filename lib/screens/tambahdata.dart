import 'package:flutter/material.dart';

class TambahData extends StatefulWidget {
  const TambahData({super.key});

  @override
  State<TambahData> createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color(0xFF3E2B67),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamed(context, '/loginScreen');
              },
              iconSize: 30,
            ),
            const SizedBox(width: 85), // Add space between arrow back icon and text
            const Text(
              "Tambah Data",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 85), // Add space between text and checkmark icon
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                // Perform action when the checkmark icon is pressed
              },
            ),
          ],
        ),
      ),
    );
  }
}
