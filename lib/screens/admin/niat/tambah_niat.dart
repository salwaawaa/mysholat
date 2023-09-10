import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TambahNiat extends StatefulWidget {
  const TambahNiat({super.key});

  @override
  State<TambahNiat> createState() => _TambahNiatState();
}

class _TambahNiatState extends State<TambahNiat> {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _teksArabController = TextEditingController();
  final TextEditingController _latinController = TextEditingController();

  Future<void> _addDataToFirestore() async {
    try {
      // Get the current maximum 'index' value from Firestore
      final maxIndex = await _getMaxIndex();

      // Increment the maximum index value by 1
      final newIndex = maxIndex + 1;

      // Add data to Firestore with the incremented 'index' value
      await FirebaseFirestore.instance.collection('niatSholat').add({
        'index': newIndex,
        'title': _judulController.text,
        'textArab': _teksArabController.text,
        'latin': _latinController.text,
        // Add other fields as needed
      });
    } catch (e) {
      // Handle any potential errors here
      if (kDebugMode) {
        print('Error adding data to Firestore: $e');
      }
    }
  }

  // Function to get the current maximum 'index' value from Firestore
  Future<int> _getMaxIndex() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('niatSholat')
        .orderBy('index', descending: true)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Retrieve the maximum 'index' value
      final maxIndex = querySnapshot.docs.first['index'] as int;
      return maxIndex;
    } else {
      // If there are no documents, start with index 1
      return 0;
    }
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed
    _judulController.dispose();
    _teksArabController.dispose();
    _latinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color(0xFF3E2B67),
        title: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Tambah Niat",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                // Perform action when the checkmark icon is pressed
                _addDataToFirestore();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Judul",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _judulController,
                decoration: InputDecoration(
                  hintText: "Masukkan Judul",
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 178, 115, 189),
                    ),
                    borderRadius: BorderRadius.circular(
                        10), // Mengatur border menjadi lingkaran
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 178, 115, 189),
                    ),
                    borderRadius: BorderRadius.circular(
                        10), // Mengatur border menjadi lingkaran
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Teks Arab",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _teksArabController,
                decoration: InputDecoration(
                  hintText: "Masukan teks arab",
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 178, 115, 189),
                    ),
                    borderRadius: BorderRadius.circular(
                        10), // Mengatur border menjadi lingkaran
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 178, 115, 189),
                    ),
                    borderRadius: BorderRadius.circular(
                        10), // Mengatur border menjadi lingkaran
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Latin",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _latinController,
                decoration: InputDecoration(
                  hintText: "Masukan latin",
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 178, 115, 189),
                    ),
                    borderRadius: BorderRadius.circular(
                        10), // Mengatur border menjadi lingkaran
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 178, 115, 189),
                    ),
                    borderRadius: BorderRadius.circular(
                        10), // Mengatur border menjadi lingkaran
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
