import 'package:flutter/material.dart';

class TambahData extends StatefulWidget {
  const TambahData({super.key});

  @override
  State<TambahData> createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color(0xFF3E2B67),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Tambah Data",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                // Perform action when the checkmark icon is pressed
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        // Tambahkan SingleChildScrollview di sini
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: double
                        .infinity, // Gunakan double.infinity agar lebar sesuai layar
                    height: 175,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 178, 115, 189),
                        width: 2.0, // Sesuaikan lebar border sesuai kebutuhan
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 178, 115, 189),
                          shape:
                              BoxShape.circle, // Membuat lingkaran untuk ikon
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 32, // Sesuaikan ukuran ikon sesuai kebutuhan
                            color: Colors
                                .white, // Sesuaikan warna ikon sesuai kebutuhan
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Judul",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Masukkan Judul",
                      hintStyle:
                          const TextStyle(fontSize: 16, color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 178, 115, 189),
                        ),
                        borderRadius: BorderRadius.circular(
                            10), // Mengatur border menjadi lingkaran
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 178, 115, 189),
                        ),
                        borderRadius: BorderRadius.circular(
                            10), // Mengatur border menjadi lingkaran
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Foto",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Isi Foto",
                      hintStyle:
                          const TextStyle(fontSize: 16, color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 178, 115, 189),
                        ),
                        borderRadius: BorderRadius.circular(
                            10), // Mengatur border menjadi lingkaran
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 178, 115, 189),
                        ),
                        borderRadius: BorderRadius.circular(
                            10), // Mengatur border menjadi lingkaran
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Deskripsi",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "Isi Deskripsi",
                            hintStyle: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 178, 115, 189),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.all(
                                120), // Sesuaikan dengan yang Anda inginkan
                          ),
                          // Mengatur teks ke pinggir kiri
                        ),
                      ),

                      // Hapus baris child yang tidak diperlukan di sini
                      Center(
                        child: Container(
                          width: 295,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF3F2C67),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "Kirim",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 237, 239, 248),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
