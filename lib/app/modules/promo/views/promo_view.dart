import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/widget/custom_navbar.dart';

class PromoView extends StatefulWidget {
  const PromoView({super.key});

  @override
  _PromoViewState createState() => _PromoViewState();
}

class _PromoViewState extends State<PromoView> {
  int _currentIndex = 1; // Indeks default untuk halaman Promo

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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Tentukan apakah perangkat adalah tablet
    final isTablet = screenWidth >= 600;

    // Daftar promo yang akan ditampilkan
    final List<Map<String, dynamic>> promoItems = [
      {
        'image': 'assets/images/natal.png', // Gambar promo Natal
        'name': 'Rayakan Natal Lebih Hangat!',
        'discount': 'Diskon 30%',
        'page': '/natal', // Navigasi ke halaman Natal
      },
      {
        'image': 'assets/images/ny.png', // Gambar promo Tahun Baru
        'name': 'Tahun Baru Penuh Semangat!',
        'discount': 'Diskon 50%',
        'page': '/newyear', // Navigasi ke halaman New Year
      },
      // Tambahkan promo lain jika diperlukan
    ];

    // Tambahkan elemen tambahan
    final List<Map<String, dynamic>> additionalItems = [
      {
        'title': 'Tips Belanja Hemat',
        'description':
            'Pelajari cara mendapatkan promo terbaik di aplikasi kami!',
        'icon': Icons.lightbulb,
        'page': '/tips', // Navigasi ke halaman tips
      },
      {
        'title': 'Produk Unggulan',
        'description':
            'Jelajahi produk-produk pilihan dengan penawaran menarik.',
        'icon': Icons.star,
        'page': '/featured', // Navigasi ke halaman produk unggulan
      },
      {
        'title': 'Testimoni Pelanggan',
        'description': 'Simak pengalaman pelanggan kami yang puas.',
        'icon': Icons.chat,
        'page': '/testimonials', // Navigasi ke halaman testimoni
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Promo',
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
            : null,
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
                      Get.toNamed('/akstivitas');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Profil'),
                    onTap: () {
                      Get.toNamed('/profile');
                    },
                  ),
                ],
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Promo saat ini yang lebih menarik',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            // Tampilkan tombol promo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: promoItems.map((item) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(item['page']);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 142, 168, 25),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          Text(
                            item['name'],
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: promoItems.length,
                itemBuilder: (context, index) {
                  final promo = promoItems[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(promo['page']);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              promo['image'],
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  promo['name'],
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  promo['discount'],
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                    child: Text(
                      'Informasi Lainnya',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ...additionalItems.map((item) {
                    return ListTile(
                      leading: Icon(item['icon'], color: Colors.blue),
                      title: Text(
                        item['title'],
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        item['description'],
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      onTap: () {
                        Get.toNamed(item['page']);
                      },
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavbar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
