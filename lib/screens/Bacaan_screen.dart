import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BacaanScreen extends StatefulWidget {
  BacaanScreen({Key? key}) : super(key: key);

  @override
  _BacaanScreenState createState() => _BacaanScreenState();
}

class _BacaanScreenState extends State<BacaanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E2B67),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: const Color(0xFF3E2B67),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, '/homeScreen');
            },
            iconSize: 45,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bacaan sholat",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Image.asset(
                      "assets/image/image3.png",
                      width: 155,
                      height: 155,
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("bacaanSholat")
                    .orderBy("index", descending: false)
                    .snapshots(),
                builder: (_, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  List<QueryDocumentSnapshot<Map<String, dynamic>>> data =
                      snapshot.data!.docs;

                  return SizedBox(
                    height: 500,
                    width: 1000,
                    child: ListView.separated(
                        itemCount: data.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(
                              width: 24,
                            ),
                        itemBuilder: (_, i) {
                          return Container(
                            width: 312,
                            height: 700,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      width: 40, // Adjust this as needed
                                      height: 40, // Adjust this as needed
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF3F2C67),
                                        border: Border.all(
                                            color: Colors.deepPurple,
                                            width: 0.8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${i + 1}",
                                          style: TextStyle(
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
                                          data[i]["title"],
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    )
                                  ],
                                ),
                                Container(
                                  height: 400,
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.only(left: 20, top: 20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Image.network(
                                          data[i]["image"],
                                          width: 180,
                                          height: 180,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          data[i]["textArab"],
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            data[i]["latin"],
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          data[i]["translate"],
                                          style: TextStyle(
                                            fontSize: 20,
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
                          );
                        }),
                  );
                }),
            // Add more widgets here if needed
          ],
        ),
      ),
    );
  }
}