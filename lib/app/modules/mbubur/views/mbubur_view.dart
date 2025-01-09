import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MbuburView extends StatelessWidget {
  const MbuburView({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar data dinamis untuk GridView
    final List<Map<String, dynamic>> items = [
      {
        'image': 'assets/images/produk.png', // Local image path
        'brand': 'Brand A',
        'name': 'Red Shirt',
        'price': '\$25',
      },
      {
        'image': 'assets/images/produk.png', // Local image path
        'brand': 'Brand B',
        'name': 'Green Blouse',
        'price': '\$30',
      },
      {
        'image': 'assets/images/produk.png', // Local image path
        'brand': 'Brand C',
        'name': 'Blue Jacket',
        'price': '\$50',
      },
      {
        'image': 'assets/images/produk.png', // Local image path
        'brand': 'Brand D',
        'name': 'Yellow Skirt',
        'price': '\$40',
      },
      {
        'image': 'assets/images/produk.png', // Local image path
        'brand': 'Brand E',
        'name': 'Purple Pants',
        'price': '\$35',
      },
      {
        'image': 'assets/images/produk.png', // Local image path
        'brand': 'Brand F',
        'name': 'Cyan T-Shirt',
        'price': '\$20',
      },
      // Tambahkan item lainnya jika diperlukan
    ];

    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      appBar: AppBar(
        title: Text(
          'Bubur',
          style: GoogleFonts.poppins(
            textStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return InkWell(
                      onTap: () {
                        // Navigasi ke halaman /det_home
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
                                item['image'], // Using local assets
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
