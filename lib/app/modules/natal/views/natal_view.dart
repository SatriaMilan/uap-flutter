import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/app/modules/natal/controllers/natal_controller.dart';

class NatalView extends GetView<NatalController> {
  const NatalView({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar data dinamis untuk GridView
    final List<Map<String, dynamic>> items = [
      {
        'image': 'assets/images/produk.png', // Local image path
        'brand': 'Brand A',
        'name': 'Red Shirt',
        'price': 'Discon \$25',
      },
      {
        'image': 'assets/images/produk.png', // Local image path
        'brand': 'Brand B',
        'name': 'Green Blouse',
        'price': 'Discon \$30',
      },
      {
        'image': 'assets/images/produk.png', // Local image path
        'brand': 'Brand C',
        'name': 'Blue Jacket',
        'price': 'Discon \$50',
      },
      {
        'image': 'assets/images/produk.png', // Local image path
        'brand': 'Brand D',
        'name': 'Yellow Skirt',
        'price': 'Discon \$40',
      },
    ];

    // Mendapatkan ukuran layar
    final screenWidth = MediaQuery.of(context).size.width;

    // Kondisi untuk tablet (biasanya lebar 600px ke atas dianggap tablet)
    final isTablet = screenWidth >= 600;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // Automatically imply the leading icon
        title: Text(
          'merry christmas',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.red,
        elevation: 0.0,
        centerTitle: true,
        // Manually setting the leading icon color to white
        leading: isTablet
            ? Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu,
                      color: Colors.white), // Set color here
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Open the Drawer
                  },
                ),
              )
            : IconButton(
                icon: const Icon(Icons.arrow_back,
                    color: Colors.white), // Back button for mobile
                onPressed: () {
                  Navigator.of(context).pop(); // Navigate back
                },
              ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Get.toNamed('/akstivitas');
            },
          ),
        ],
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
                    title: const Text('Profile'),
                    onTap: () {
                      Get.toNamed('/profile');
                    },
                  ),
                ],
              ),
            )
          : null,

      // Drawer hanya tampil di tablet
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.red,
              child: SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/promo', arguments: {'id': 1});
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/natal.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/promo', arguments: {'id': 2});
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/natal.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/promo', arguments: {'id': 3});
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/natal.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Menu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
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
                itemCount:
                    items.length, // Gunakan jumlah item sesuai data produk
                itemBuilder: (context, index) {
                  final item =
                      items[index]; // Mendapatkan item dari list produk
                  return InkWell(
                    onTap: () {
                      // Navigasi ke halaman detail produk
                      Get.toNamed('/det-home');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              item['image'], // Menggunakan gambar produk
                              fit: BoxFit.cover,
                              height: 120,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['brand'],
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['name'],
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  item['price'],
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
            )
          ],
        ),
      ),
    );
  }
}
