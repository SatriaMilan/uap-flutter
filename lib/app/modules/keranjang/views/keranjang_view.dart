import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/keranjang_controller.dart';

class KeranjangView extends GetView<KeranjangController> {
  const KeranjangView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil data dari arguments, gunakan nilai default jika null
    final arguments = Get.arguments ?? {'items': []};
    final items = arguments['items'] as List;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
        centerTitle: true,
      ),
      body: items.isEmpty
          ? const Center(
              child: Text(
                'Keranjang kosong',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      child: const Icon(Icons.shopping_bag, color: Colors.grey),
                    ),
                    title: Text(
                      item['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      'Harga: ${item['price']}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // Tambahkan logika hapus item dari keranjang
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
