import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class TambahBacaan extends StatefulWidget {
  const TambahBacaan({super.key});

  @override
  State<TambahBacaan> createState() => _TambahBacaanState();
}

class _TambahBacaanState extends State<TambahBacaan> {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _teksArabController = TextEditingController();
  final TextEditingController _latinController = TextEditingController();
  final TextEditingController _translateController = TextEditingController();

  Future<void> _addDataToFirestore() async {
    try {
      // Get the current maximum 'index' value from Firestore
      final maxIndex = await _getMaxIndex();

      // Increment the maximum index value by 1
      final newIndex = maxIndex + 1;

      // Upload the image to Firebase Storage
      final firebase_storage.Reference storageRef = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('images')
          .child('bacaan_$newIndex.jpg');

      final UploadTask uploadTask = storageRef.putFile(_selectedImage!);

      // Wait for the upload to complete and get the download URL
      final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      final imageUrl = await taskSnapshot.ref.getDownloadURL();

      // Add data to Firestore with the incremented 'index' value and the image URL
      await FirebaseFirestore.instance.collection('bacaanSholat').add({
        'index': newIndex,
        'title': _judulController.text,
        'textArab': _teksArabController.text,
        'latin': _latinController.text,
        'image': imageUrl,
        'translate': _translateController.text
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
    _translateController.dispose();
    super.dispose();
  }

  File? _selectedImage;

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
              "Tambah Data",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
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
                "Masukan Gambar",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              if (_selectedImage != null)
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(_selectedImage!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ElevatedButton(
                onPressed: () async {
                  final imagePicker = ImagePicker();
                  final XFile? pickedImage = await imagePicker.pickImage(
                    source: ImageSource
                        .gallery, // You can also use ImageSource.camera
                  );
                  if (pickedImage != null) {
                    setState(() {
                      _selectedImage = File(pickedImage.path);
                    });
                  }
                },
                child: const Text('Pilih Gambar'),
              ),
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
              ),
              const Text(
                "Translate",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _translateController,
                decoration: InputDecoration(
                  hintText: "Masukan translate",
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
