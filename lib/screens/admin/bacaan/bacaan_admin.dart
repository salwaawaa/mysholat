import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BacaanAdmin extends StatefulWidget {
  const BacaanAdmin({super.key});

  @override
  State<BacaanAdmin> createState() => _BacaanAdminState();
}

class _BacaanAdminState extends State<BacaanAdmin> {
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
                  Navigator.pushNamed(context, '/tambahdata');
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
              height: 35,
            ),
            Column(
              children: [Container()],
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

                  return SizedBox(
                    height: 500,
                    width: 1000,
                    child: ListView.separated(
                        itemCount: data.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
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
                                      margin: const EdgeInsets.all(10),
                                      width: 40, // Adjust this as needed
                                      height: 40, // Adjust this as needed
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color(0xFF3F2C67),
                                        border: Border.all(
                                            color: Colors.deepPurple,
                                            width: 0.8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${i + 1}",
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
                                          data[i]["title"],
                                          style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 50,
                                    )
                                  ],
                                ),
                                Container(
                                  height: 400,
                                  padding: const EdgeInsets.all(5),
                                  margin:
                                      const EdgeInsets.only(left: 20, top: 20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Image.network(
                                          data[i]["image"],
                                          width: 180,
                                          height: 180,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          data[i]["textArab"],
                                          style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                            data[i]["latin"],
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          data[i]["translate"],
                                          style: const TextStyle(
                                            fontSize: 15,
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

  _listBacaan(
      BuildContext context, DocumentSnapshot<Map<String, dynamic>> docs) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 450),
        child: Container(
          padding: const EdgeInsets.all(16),
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
                height: 450,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Image.network(
                        docs["image"],
                        scale: 4,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
