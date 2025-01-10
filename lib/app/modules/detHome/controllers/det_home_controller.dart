import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DetHomeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Fungsi untuk tambah ke keranjang
  Future<void> addToCart(
      String productId, String productName, int quantity, int price) async {
    if (productId.isEmpty ||
        productName.isEmpty ||
        quantity <= 0 ||
        price <= 0) {
      Get.snackbar('Error', 'Input tidak valid. Mohon cek kembali.');
      return;
    }

    try {
      await _firestore.collection('keranjang').add({
        'productId': productId,
        'productName': productName,
        'quantity': quantity,
        'price': price,
        'createdAt': FieldValue.serverTimestamp(),
      });
      Get.snackbar('Sukses', 'Produk berhasil ditambahkan ke keranjang!');
    } catch (e) {
      Get.snackbar('Error', 'Gagal menambahkan produk ke keranjang: $e');
      print('Error addToCart: $e'); // Logging untuk debugging
    }
  }

  /// Fungsi untuk beli langsung
  Future<void> buyNow(
      String productId, String productName, int quantity, int price) async {
    if (productId.isEmpty ||
        productName.isEmpty ||
        quantity <= 0 ||
        price <= 0) {
      Get.snackbar('Error', 'Input tidak valid. Mohon cek kembali.');
      return;
    }

    try {
      await _firestore.collection('payment').add({
        'productId': productId,
        'productName': productName,
        'quantity': quantity,
        'price': price,
        'status': 'pending', // Status awal untuk pembayaran
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Navigasi ke halaman pembayaran setelah sukses
      Get.toNamed('/payment');
    } catch (e) {
      Get.snackbar('Error', 'Gagal melakukan pembelian: $e');
      print('Error buyNow: $e'); // Logging untuk debugging
    }
  }
}
