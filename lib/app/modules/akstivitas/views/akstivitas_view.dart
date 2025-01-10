import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Tambahkan untuk Firestore
import 'package:myapp/app/modules/akstivitas/controllers/akstivitas_controller.dart';
import 'package:myapp/widget/custom_navbar.dart';

class AktivitasView extends StatefulWidget {
  const AktivitasView({super.key});

  @override
  _AktivitasViewState createState() => _AktivitasViewState();
}

class _AktivitasViewState extends State<AktivitasView> {
  int _currentIndex = 2; // Indeks default untuk halaman Aktivitas
  String filterOption = 'Semua Riwayat'; // Pilihan filter default

  // Fungsi untuk menangani tab yang dipilih
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index; // Memperbarui indeks saat tab dipilih
    });

    // Navigasi ke halaman sesuai dengan tab yang dipilih
    if (index == 0) {
      Get.toNamed('/home');
    } else if (index == 1) {
      Get.toNamed('/promo');
    } else if (index == 2) {
      Get.toNamed('/akstivitas');
    } else if (index == 3) {
      Get.toNamed('/profile');
    }
  }

  // Fungsi untuk memfilter data berdasarkan pilihan
  void filterTransactions() {
    final AkstivitasController controller = Get.find<AkstivitasController>();

    if (filterOption == 'Hari Ini') {
      controller.filterByToday();
    } else if (filterOption == 'Per Jam') {
      controller.filterByLastHour();
    } else {
      controller.fetchAllTransactions();
    }
  }

  @override
  Widget build(BuildContext context) {
    final AkstivitasController controller = Get.put(AkstivitasController());

    // Mendapatkan ukuran layar
    final screenWidth = MediaQuery.of(context).size.width;

    // Kondisi untuk tablet (biasanya lebar 600px ke atas dianggap tablet)
    final isTablet = screenWidth >= 600;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Nonaktifkan ikon panah
        title: Text(
          'Aktivitas',
          style: GoogleFonts.poppins(
            textStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: isTablet
            ? Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Membuka Drawer
                  },
                ),
              )
            : null, // Tidak ada ikon menu pada mobile
      ),
      drawer: isTablet
          ? Drawer(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () {
                      Get.toNamed('/home');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.local_offer),
                    title: const Text('Promo'),
                    onTap: () {
                      Get.toNamed('/promo');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.access_time),
                    title: const Text('Aktivitas'),
                    onTap: () {
                      Get.toNamed('/aktivitas');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Profile'),
                    onTap: () {
                      Get.toNamed('/profile');
                    },
                  ),
                ],
              ),
            )
          : null, // Drawer hanya tampil di tablet
      bottomNavigationBar: isTablet
          ? null // Tablet tidak memiliki navbar di bawah
          : CustomNavbar(
              currentIndex: _currentIndex, // Menggunakan _currentIndex
              onTap: _onTabTapped, // Memanggil _onTabTapped saat tab dipilih
            ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Pilihan filter menggunakan tombol horizontal
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <String>['Semua Riwayat', 'Hari Ini', 'Per Jam']
                      .map((option) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          filterOption = option;
                        });
                        filterTransactions(); // Panggil fungsi filter setelah pilihan berubah
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: filterOption == option
                              ? Colors.green
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          option,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: filterOption == option
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            // Tampilan Transaksi
            Expanded(
              child: Obx(() {
                if (controller.transactions.isEmpty) {
                  return const Center(
                    child: Text(
                      'Tidak ada transaksi',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: controller.transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = controller.transactions[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Transaksi ${transaction['id']}',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Tanggal: ${transaction['timestamp']}',
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                            const SizedBox(height: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                  transaction['items'].length, (index) {
                                final item = transaction['items'][index];
                                return Text(
                                  '${item['name']} x ${item['quantity']} - Rp${item['total']}',
                                  style: GoogleFonts.poppins(fontSize: 14),
                                );
                              }),
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Pembayaran',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Rp${transaction['totalPayment']}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
