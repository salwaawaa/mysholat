import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  // This controller will store the value of the search bar
  final TextEditingController _searchController = TextEditingController();
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: 'Search...',
      // Add a clear button to the search bar
      suffixIcon: IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => widget._searchController.clear(),
      ),
      // Add a search icon or button to the search bar
      prefixIcon: IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          // Perform the search here
        },
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
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
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  // Add padding around the search bar
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  // Use a Material design search bar
                  child: TextField(
                    controller: widget._searchController,
                    decoration: inputDecoration,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/niatScreen');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(.300),
                        child: Container(
                          width: 336,
                          padding: const EdgeInsets.all(28.0),
                          height: 121,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: const Color.fromARGB(255, 254, 253,
                                  253), // You can change the color of the border here
                              width:
                                  2.0, // You can change the width of the border here
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/image/image2.png",
                                width: 100, // Lebar gambar
                                height: 100, // Tinggi gambar
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
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/bacaanScreen');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(.300),
                        child: Container(
                          width: 336,
                          padding: const EdgeInsets.all(28.0),
                          height: 121,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: const Color.fromARGB(255, 254, 253,
                                  253), // You can change the color of the border here
                              width:
                                  2.0, // You can change the width of the border here
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/image/image3.png",
                                width: 100, // Lebar gambar
                                height: 100, // Tinggi gambar
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
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/dzikirScreen');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(.300),
                        child: Container(
                          width: 336,
                          padding: const EdgeInsets.all(28.0),
                          height: 121,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: const Color.fromARGB(255, 254, 253,
                                  253), // You can change the color of the border here
                              width:
                                  2.0, // You can change the width of the border here
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/image/image2.png",
                                width: 100, // Lebar gambar
                                height: 100, // Tinggi gambar
                              ),
                              const Text(
                                "Dzikir",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
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
          ),
        ),
      ),
    );
  }
}
