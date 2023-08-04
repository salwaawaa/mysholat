import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
// This controller will store the value of the search bar
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: 'Search...',
      // Add a clear button to the search bar
      suffixIcon: IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => _searchController.clear(),
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
                            "15:30",
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
                      Container(
                        width: 160,
                        height: 150,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/images01.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
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
                    controller: _searchController,
                    decoration: inputDecoration,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
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
                          child: Text("Niat niat sholat",
                              style: TextStyle(fontSize: 25)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
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
                          child: Text("Bacaan-Bacaan Sholat ",
                              style: TextStyle(fontSize: 25)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
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
                          child: Text("Dzikir", style: TextStyle(fontSize: 25)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
