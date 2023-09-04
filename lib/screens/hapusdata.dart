import 'package:flutter/material.dart';

class HapusData extends StatefulWidget {
  const HapusData({super.key});

  @override
  State<HapusData> createState() => _HapusDataState();
}

class _HapusDataState extends State<HapusData> {
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
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamed(context, '/loginScreen');
              },
              iconSize: 30,
            ),
            SizedBox(width: 85), // Add space between arrow back icon and text
            Text(
              "hapus Data",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(width: 85), // Add space between text and checkmark icon
            IconButton(
              icon: Icon(Icons.check),
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
