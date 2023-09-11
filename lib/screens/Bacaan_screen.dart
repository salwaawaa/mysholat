// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BacaanScreen extends StatefulWidget {
  const BacaanScreen({Key? key}) : super(key: key);

  @override
  _BacaanScreenState createState() => _BacaanScreenState();
}

class _BacaanScreenState extends State<BacaanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E2B67),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3E2B67),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Bacaan\nShalat",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: Image.asset(
                      "assets/image/image3.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("bacaanSholat")
                  .orderBy("index", descending: false)
                  .snapshots(),
              builder: (_, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                List<QueryDocumentSnapshot<Map<String, dynamic>>> data =
                    snapshot.data!.docs;

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      data.length,
                      (index) {
                        DocumentSnapshot<Map<String, dynamic>> docs =
                            data[index];
                        return _listBacaan(context, docs);
                      },
                    ),
                  ),
                );
              },
            ),
            // Add more widgets here if needed
          ],
        ),
      ),
    );
  }

  Widget _listBacaan(
      BuildContext context, DocumentSnapshot<Map<String, dynamic>> docs) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 30, // Adjust this as needed
                    height: 30, // Adjust this as needed
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF3F2C67),
                      border: Border.all(color: Colors.deepPurple, width: 0.8),
                    ),
                    child: Center(
                      child: Text(
                        "${docs["index"]}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        // Provide meaningful content here
                      ),
                    ),
                  ),
                  Flexible(
                    child: FittedBox(
                      child: Text(
                        docs["title"],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 400, // Adjust this as needed
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Image.network(
                        docs["image"],
                        scale: 4,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          // Handle image loading error (e.g., display a placeholder image or show an error message)
                          return const Placeholder(); // Replace with your error handling widget.
                        },
                      ),
                      const SizedBox(height: 10),
                      Text(
                        docs["textArab"],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        docs["latin"],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        docs["translate"],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
