import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mysholat/screens/admin/bacaan/edit_bacaan.dart';

class BacaanAdmin extends StatefulWidget {
  const BacaanAdmin({super.key});

  @override
  State<BacaanAdmin> createState() => _BacaanAdminState();
}

class _BacaanAdminState extends State<BacaanAdmin> {
  get docs => null;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 160,
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
                height: 15,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/tambahBacaan');
                  },
                  child: Container(
                    width: 140,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF984EF8),
                    ),
                    child: const Center(
                      child: Text(
                        "Tambah Data",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Set the text color
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
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
      ),
    );
  }

  Widget _listBacaan(
      BuildContext context, DocumentSnapshot<Map<String, dynamic>> docs) {
    void _deleteDocument() async {
      try {
        await docs.reference.delete();
      } catch (e) {
        if (kDebugMode) {
          print('Error deleting document: $e');
        }
      }
    }

    return Row(
      children: [
        Card(
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
                          border:
                              Border.all(color: Colors.deepPurple, width: 0.8),
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
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
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
        ),
        Container(
          width: 46,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        title: const Text('Konfirmasi'),
                        content:
                            const Text('Apakah kamu yakin ingin menghapusnya?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(dialogContext).pop();
                            },
                            child: const Text('Batal'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Call the _deleteDocument function to delete the document
                              _deleteDocument();
                              Navigator.of(dialogContext)
                                  .pop(); // Close the dialog
                            },
                            child: const Text('Hapus'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
