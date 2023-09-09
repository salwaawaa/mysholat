import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditNiat extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> document;

  const EditNiat({Key? key, required this.document}) : super(key: key);

  @override
  _EditNiatState createState() => _EditNiatState();
}

class _EditNiatState extends State<EditNiat> {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _teksArabController = TextEditingController();
  final TextEditingController _latinController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Populate the text fields with the existing data
    final data = widget.document.data() as Map<String, dynamic>;
    _judulController.text = data['title'];
    _teksArabController.text = data['textArab'];
    _latinController.text = data['latin'];
  }

  // Function to update data in Firestore
  Future<void> _updateDataInFirestore() async {
    try {
      await widget.document.reference.update({
        'title': _judulController.text,
        'textArab': _teksArabController.text,
        'latin': _latinController.text,
        // Add other fields as needed
      });
    } catch (e) {
      // Handle any potential errors here
      print('Error updating data in Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color(0xFF3E2B67),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Edit Niat",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                // Call the function to update data in Firestore
                _updateDataInFirestore();
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 178, 115, 189),
                    ),
                    borderRadius: BorderRadius.circular(10),
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
                  hintText: "Masukkan teks arab",
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 178, 115, 189),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 178, 115, 189),
                    ),
                    borderRadius: BorderRadius.circular(10),
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
                  hintText: "Masukkan latin",
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 178, 115, 189),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 178, 115, 189),
                    ),
                    borderRadius: BorderRadius.circular(10),
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
