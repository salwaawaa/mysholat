import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NiatScreen extends StatefulWidget {
  const NiatScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NiatScreenState createState() {
    return _NiatScreenState();
  }
}

class _NiatScreenState extends State<NiatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E2B67),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: const Color(0xFF3E2B67),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection("niatSholat")
            .orderBy("index", descending: false)
            .snapshots(),
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          List<QueryDocumentSnapshot<Map<String, dynamic>>> data =
              snapshot.data!.docs;

          if (data.isNotEmpty) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Niat Shalat",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: "Poppins"),
                        ),
                        SizedBox(
                          width: 180,
                          child: Image.asset(
                            "assets/image/image2.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(data.length, (index) {
                        DocumentSnapshot<Map<String, dynamic>> docs =
                            data[index];
                        return _listCard(context, docs);
                      }),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  _listCard(BuildContext context, DocumentSnapshot<Map<String, dynamic>> docs) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: 400,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF3F2C67),
                    border: Border.all(
                      color: Colors.deepPurple,
                      width: 0.8,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "${docs["index"]}", // Use the "index" field from Firestore
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  docs["title"].toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                docs["textArab"].toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              docs["latin"].toString(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
