import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/auth/controllers/auth_controller.dart';
import 'package:myapp/widget/custom_navbar.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});
  final AuthController _authController = Get.put(AuthController());
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0; // Indeks default untuk halaman Home

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
    // Mendapatkan ukuran layar
    final screenWidth = MediaQuery.of(context).size.width;

    // Kondisi untuk tablet (biasanya lebar 600px ke atas dianggap tablet)
    final isTablet = screenWidth >= 600;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Nonaktifkan ikon panah
        backgroundColor: Colors.green,
        elevation: 0.0,
        centerTitle: true,
        leading: isTablet
            ? Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Membuka Drawer
                  },
                ),
              )
            : null, // Tidak ada ikon menu pada mobile
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Get.toNamed('/keranjang'); // Navigasi ke keranjang
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
          : null, // Drawer hanya tampil di tablet
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.green,
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
                            image: AssetImage('assets/images/iklan.png'),
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
                            image: AssetImage('assets/images/ny.png'),
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
                'All Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //   child: Wrap(
            //     spacing: 10,
            //     runSpacing: 10,
            //     children: [
            //       {
            //         'label': 'Bubur',
            //         'icon': Icons.rice_bowl,
            //         'color': Colors.orange
            //       },
            //       {
            //         'label': 'Mie Godog',
            //         'icon': Icons.restaurant,
            //         'color': Colors.red
            //       },
            //       {
            //         'label': 'Mie Goreng',
            //         'icon': Icons.fastfood,
            //         'color': Colors.blue
            //       },
            //       {
            //         'label': 'Minuman Dingin',
            //         'icon': Icons.icecream,
            //         'color': Colors.lightBlueAccent
            //       },
            //       {
            //         'label': 'Minuman Panas',
            //         'icon': Icons.coffee,
            //         'color': Colors.brown
            //       },
            //     ].map((category) {
            //       return SizedBox(
            //         width: MediaQuery.of(context).size.width / 3.5,
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             Container(
            //               width: 60,
            //               height: 60,
            //               decoration: const BoxDecoration(
            //                 color: Colors.green,
            //                 shape: BoxShape.circle,
            //               ),
            //               child: Icon(
            //                 category['icon'] as IconData,
            //                 color: Colors.white,
            //               ),
            //             ),
            //             const SizedBox(height: 5),
            //             Text(
            //               category['label'] as String,
            //               style: const TextStyle(fontSize: 12),
            //               textAlign: TextAlign.center,
            //             ),
            //           ],
            //         ),
            //       );
            //     }).toList(),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  {
                    'label': 'Bubur',
                    'icon': Icons.rice_bowl,
                    'color': const Color.fromARGB(255, 35, 142, 89)
                  },
                  {
                    'label': 'Mie Godog',
                    'icon': Icons.restaurant,
                    'color': const Color.fromARGB(255, 35, 142, 89)
                  },
                  {
                    'label': 'Mie Goreng',
                    'icon': Icons.fastfood,
                    'color': const Color.fromARGB(255, 35, 142, 89)
                  },
                  {
                    'label': 'Minuman Dingin',
                    'icon': Icons.icecream,
                    'color': const Color.fromARGB(255, 35, 142, 89)
                  },
                  {
                    'label': 'Minuman Panas',
                    'icon': Icons.coffee,
                    'color': const Color.fromARGB(255, 35, 142, 89)
                  },
                  {
                    'label': 'Lihat Lebih',
                    'icon': Icons.restaurant_menu,
                    'color': const Color.fromARGB(255, 35, 142, 89)
                  },
                ].map((category) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 3.5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Kondisi untuk kategori 'Bubur' navigasi ke /mbubur
                            if (category['label'] == 'Bubur') {
                              Get.toNamed('/mbubur');
                            } else {
                              // Navigasi ke MenuMakananView untuk kategori lainnya
                              Get.toNamed('/menumakanan',
                                  arguments: {'category': category['label']});
                            }
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: category['color'] as Color,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              category['icon'] as IconData,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          category['label'] as String,
                          style: const TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Cards and Lists',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Card(
                    elevation: 4,
                    child: ListTile(
                      leading: const Icon(Icons.account_circle),
                      title: const Text('Card with ListTile'),
                      subtitle: const Text('Subtitle text'),
                      trailing: const Icon(Icons.more_vert),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: const Text('Simple ListTile'),
                    subtitle: const Text('Another subtitle'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Grid View',
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
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    child: Center(
                      child: Text('Item ${index + 1}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: isTablet
          ? null
          : CustomNavbar(
              currentIndex: _currentIndex, // Menggunakan _currentIndex
              onTap: _onTabTapped, // Memanggil _onTabTapped saat tab dipilih
            ),
    );
  }
}
