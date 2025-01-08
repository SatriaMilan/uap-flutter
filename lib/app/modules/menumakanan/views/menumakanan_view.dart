import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/menumakanan_controller.dart';

class MenumakananView extends GetView<MenumakananController> {
  const MenumakananView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // Automatically imply the leading icon
        title: Text(
          'Menu',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const CircleAvatar(
                        child: Icon(Icons.rice_bowl, color: Colors.white),
                        backgroundColor: Color.fromARGB(255, 35, 142, 89)),
                    title: const Text('Bubur'),
                    subtitle: const Text('Another subtitle'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Get.toNamed('/mbubur');
                    },
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.restaurant, color: Colors.white),
                      backgroundColor: Color.fromARGB(255, 35, 142, 89),
                    ),
                    title: const Text('Mie Godog'),
                    subtitle: const Text('Another subtitle'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.fastfood, color: Colors.white),
                      backgroundColor: Color.fromARGB(255, 35, 142, 89),
                    ),
                    title: const Text('Mie Goreng'),
                    subtitle: const Text('Another subtitle'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.icecream, color: Colors.white),
                      backgroundColor: Color.fromARGB(255, 35, 142, 89),
                    ),
                    title: const Text('Minuman Dingin'),
                    subtitle: const Text('Another subtitle'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.coffee, color: Colors.white),
                      backgroundColor: Color.fromARGB(255, 35, 142, 89),
                    ),
                    title: const Text('Minuman Panas'),
                    subtitle: const Text('Another subtitle'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
