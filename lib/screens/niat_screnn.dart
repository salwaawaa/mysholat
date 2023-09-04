import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NiatScreen extends StatefulWidget {
  NiatScreen({Key? key}) : super(key: key);

  @override
  _NiatScreenState createState() => _NiatScreenState();
}

class _NiatScreenState extends State<NiatScreen> {
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
      body: SingleChildScrollView(
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
                        "Niat sholat",
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Image.asset(
                      "assets/image/image2.png",
                      width: 180,
                      height: 180,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Card(
                child: Container(
                  width: 400,
                  height: 150,
                  child: Row(
                    children: [
                      StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("niatSholat")
                            .snapshots(),
                        builder: (_, snapshot) {
                          if (!snapshot.hasData) {
                            return CircularProgressIndicator();
                          }
                          List<QueryDocumentSnapshot<Map<String, dynamic>>>
                              data = snapshot.data!.docs;
                          return SizedBox(
                            height: 450,
                            child: ListView.separated(
                              itemCount: data.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              separatorBuilder: (context, index) => SizedBox(
                                height: 24,
                              ),
                              itemBuilder: (_, i) {
                                return Container(
                                  width: 312,
                                  height: 685,
                                  color: Colors.white,
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Text(
                                          data[i]["title"],
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          data[i]["textArab"],
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          data[i]["latin"],
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    )
                                  ]),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Add more widgets here if needed
          ],
        ),
      ),
    );
  }
}
