import 'package:flutter/material.dart';

// ignore: camel_case_types
class notesscreen extends StatefulWidget {
  const notesscreen({super.key});

  @override
  State<notesscreen> createState() => _notesscreenState();
}

// ignore: camel_case_types
class _notesscreenState extends State<notesscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E2B67),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
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
                            "Assalamualaikum, \nSalwa!",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "15:05",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "15 menit lagi menuju shalat ashar",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                            "assets/image/image1.png",
                            width: 150, // Lebar gambar
                            height: 150, // Tinggi gambar
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/tambahdata');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(
                              16.0), // Adjust the padding as needed
                          child: Container(
                            width: 100,
                            height: 39,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF984EF8),
                            ),
                            child: const Center(
                              child: Text(
                                "Tambah Data",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white, // Set the text color
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/niatScreen');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(.300),
                        child: Row(
                          children: [
                            Container(
                              width: 300,
                              padding: const EdgeInsets.all(28.0),
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 254, 253, 253),
                                  width: 2.0,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/image/image2.png",
                                    width: 95,
                                    height: 95,
                                  ),
                                  const Text(
                                    "Niat niat sholat",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 44,
                                height: 115,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          showModalBottomSheet(
                                            elevation: 0,
                                            enableDrag: true,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(50),
                                                topRight: Radius.circular(50),
                                              ),
                                            ),
                                            context: context,
                                            builder: (BuildContext context) {
                                              return SizedBox(
                                                height: 300,
                                                child: Center(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      const Text(
                                                        "Hapus?",
                                                        style: TextStyle(
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),

                                                      const Divider(),
                                                      // Add a Divider here
                                                      Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(.15),
                                                            child: Container(
                                                              width: 336,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(25),
                                                              height: 121,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xFFE7E7E7),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color
                                                                          .fromARGB(
                                                                      255,
                                                                      254,
                                                                      253,
                                                                      253),
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Image.asset(
                                                                    "assets/image/image2.png",
                                                                    width: 95,
                                                                    height: 95,
                                                                  ),
                                                                  const Text(
                                                                    "Bacaan ",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          25,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(25),
                                                            child: Row(
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    const SizedBox(
                                                                      height:
                                                                          13,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              180,
                                                                          height:
                                                                              37,
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: const Color(0xFFE7E7E7), // Set the background color to red
                                                                              borderRadius: BorderRadius.circular(10.0), // Set the border radius
                                                                            ),
                                                                            child:
                                                                                const Padding(
                                                                              padding: EdgeInsets.all(10),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    "Batal",
                                                                                    style: TextStyle(
                                                                                      fontSize: 20,
                                                                                      fontWeight: FontWeight.w700,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    const SizedBox(
                                                                      height:
                                                                          13,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              150,
                                                                          height:
                                                                              37,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                150,
                                                                            height:
                                                                                57,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.red, // Set the background color to red
                                                                              borderRadius: BorderRadius.circular(10.0), // Set the border radius
                                                                            ),
                                                                            child:
                                                                                const Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  "Ya, hapus",
                                                                                  style: TextStyle(
                                                                                    fontSize: 20,
                                                                                    fontWeight: FontWeight.w700,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      // Add more widgets for the bottom sheet content
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () {
                                        showModalBottomSheet(
                                          elevation: 0,
                                          enableDrag: true,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50),
                                              topRight: Radius.circular(50),
                                            ),
                                          ),
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SizedBox(
                                              height: 300,
                                              child: Center(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    const Text(
                                                      "Edit?",
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),

                                                    const Divider(),
                                                    // Add a Divider here
                                                    Column(
                                                      children: [


                                
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(.15),
                                                          child: Container(
                                                            width: 336,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(25),
                                                            height: 121,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xFFE7E7E7),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              border:
                                                                  Border.all(
                                                                color: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    254,
                                                                    253,
                                                                    253),
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Image.asset(
                                                                  "assets/image/image2.png",
                                                                  width: 95,
                                                                  height: 95,
                                                                ),
                                                                const Text(
                                                                  "Niat niat sholat",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        25,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(25),
                                                          child: Row(
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  const SizedBox(
                                                                    height: 13,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            180,
                                                                        height:
                                                                            37,
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                const Color(0xFFE7E7E7), // Set the background color to red
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0), // Set the border radius
                                                                          ),
                                                                          child:
                                                                              const Padding(
                                                                            padding:
                                                                                EdgeInsets.all(10),
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  "Batal",
                                                                                  style: TextStyle(
                                                                                    fontSize: 20,
                                                                                    fontWeight: FontWeight.w700,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              Column(
                                                                children: [
                                                                  const SizedBox(
                                                                    height: 13,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            150,
                                                                        height:
                                                                            37,
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              150,
                                                                          height:
                                                                              57,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.red, // Set the background color to red
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0), // Set the border radius
                                                                          ),
                                                                          child:
                                                                              const Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                "Edit",
                                                                                style: TextStyle(
                                                                                  fontSize: 20,
                                                                                  fontWeight: FontWeight.w700,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    // Add more widgets for the bottom sheet content
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/bacaanScreen');
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(.300),
                            child: Container(
                              width: 300,
                              padding: const EdgeInsets.all(28.0),
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 254, 253, 253),
                                  width: 2.0,
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/image/image3.png",
                                    width: 100,
                                    height: 100,
                                  ),
                                  const Text(
                                    "Bacaan Sholat ",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 44,
                              height: 115,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      showModalBottomSheet(
                                        elevation: 0,
                                        enableDrag: true,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(50),
                                          ),
                                        ),
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SizedBox(
                                            height: 300,
                                            child: Center(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  const Text(
                                                    "Hapus?",
                                                    style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),

                                                  const Divider(),
                                                  // Add a Divider here
                                                  Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(.15),
                                                        child: Container(
                                                          width: 336,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(25),
                                                          height: 121,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xFFE7E7E7),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            border: Border.all(
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  254,
                                                                  253,
                                                                  253),
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Image.asset(
                                                                "assets/image/image2.png",
                                                                width: 95,
                                                                height: 95,
                                                              ),
                                                              const Text(
                                                                "Niat niat sholat",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 25,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(25),
                                                        child: Row(
                                                          children: [
                                                            Column(
                                                              children: [
                                                                const SizedBox(
                                                                  height: 13,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width:
                                                                          180,
                                                                      height:
                                                                          37,
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              const Color(0xFFE7E7E7), // Set the background color to red
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0), // Set the border radius
                                                                        ),
                                                                        child:
                                                                            const Padding(
                                                                          padding:
                                                                              EdgeInsets.all(10),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                "Batal",
                                                                                style: TextStyle(
                                                                                  fontSize: 20,
                                                                                  fontWeight: FontWeight.w700,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Column(
                                                              children: [
                                                                const SizedBox(
                                                                  height: 13,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width:
                                                                          150,
                                                                      height:
                                                                          37,
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150,
                                                                        height:
                                                                            57,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.red, // Set the background color to red
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0), // Set the border radius
                                                                        ),
                                                                        child:
                                                                            const Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              "Ya, hapus",
                                                                              style: TextStyle(
                                                                                fontSize: 20,
                                                                                fontWeight: FontWeight.w700,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 296,
                                                        height: 116,
                                                      ),
                                                    ],
                                                  ),
                                                  // Add more widgets for the bottom sheet content
                                                ],
                                              ),
                                            ),
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
                                      onPressed: () {
                                        showModalBottomSheet(
                                          elevation: 0,
                                          enableDrag: true,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50),
                                              topRight: Radius.circular(50),
                                            ),
                                          ),
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SizedBox(
                                              height: 300,
                                              child: Center(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    const Text(
                                                      "Edit?",
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),

                                                    const Divider(),
                                                    // Add a Divider here
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(.15),
                                                          child: Container(
                                                            width: 336,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(25),
                                                            height: 121,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xFFE7E7E7),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              border:
                                                                  Border.all(
                                                                color: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    254,
                                                                    253,
                                                                    253),
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Image.asset(
                                                                  "assets/image/image2.png",
                                                                  width: 95,
                                                                  height: 95,
                                                                ),
                                                                const Text(
                                                                  "Niat niat sholat",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        25,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 296,
                                                          height: 116,
                                                        ),
                                                      ],
                                                    ),
                                                    // Add more widgets for the bottom sheet content
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/bacaanScreen');
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(.300),
                            child: Container(
                              width: 300,
                              padding: const EdgeInsets.all(28.0),
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 254, 253, 253),
                                  width: 2.0,
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/image/image2.png",
                                    width: 100,
                                    height: 100,
                                  ),
                                  const Text(
                                    "Dzikir ",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 44,
                              height: 115,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        showModalBottomSheet(
                                          elevation: 0,
                                          enableDrag: true,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50),
                                              topRight: Radius.circular(50),
                                            ),
                                          ),
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SizedBox(
                                              height: 300,
                                              child: Center(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    const Text(
                                                      "hapus?",
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),

                                                    const Divider(),
                                                    // Add a Divider here
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(.15),
                                                          child: Container(
                                                            width: 336,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(25),
                                                            height: 121,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xFFE7E7E7),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              border:
                                                                  Border.all(
                                                                color: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    254,
                                                                    253,
                                                                    253),
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Image.asset(
                                                                  "assets/image/image2.png",
                                                                  width: 95,
                                                                  height: 95,
                                                                ),
                                                                const Text(
                                                                  "Niat niat sholat",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        25,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 296,
                                                          height: 116,
                                                        ),
                                                      ],
                                                    ),
                                                    // Add more widgets for the bottom sheet content
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }),
                                  IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () {
                                        showModalBottomSheet(
                                          elevation: 0,
                                          enableDrag: true,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50),
                                              topRight: Radius.circular(50),
                                            ),
                                          ),
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SizedBox(
                                              height: 300,
                                              child: Center(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    const Text(
                                                      "Edit?",
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),

                                                    const Divider(),
                                                    // Add a Divider here
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(.15),
                                                          child: Container(
                                                            width: 336,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(25),
                                                            height: 121,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xFFE7E7E7),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              border:
                                                                  Border.all(
                                                                color: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    254,
                                                                    253,
                                                                    253),
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Image.asset(
                                                                  "assets/image/image2.png",
                                                                  width: 95,
                                                                  height: 95,
                                                                ),
                                                                const Text(
                                                                  "Niat niat sholat",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        25,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 296,
                                                          height: 116,
                                                        ),
                                                      ],
                                                    ),
                                                    // Add more widgets for the bottom sheet content
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 300,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
