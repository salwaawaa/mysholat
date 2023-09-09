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
            Navigator.pushNamed(context, '/homeScreen');
          },
          iconSize: 45,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Niat sholat",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
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
                  return ListView.separated(
                    itemCount: data.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                    itemBuilder: (_, i) {
                      return _listCard(data[i].data());
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _listCard(Map<String, dynamic> data) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: 400,
      height: 160,
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
                width: 40,
                height: 40,
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
                    "${data["index"]}", // Use the "index" field from Firestore
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                data["title"].toString(),
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            data["textArab"].toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            data["latin"].toString(),
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
