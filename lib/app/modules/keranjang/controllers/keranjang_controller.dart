import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class KeranjangController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Objek observasi untuk daftar item keranjang
  var cartItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCartItems(); // Ambil data keranjang saat controller diinisialisasi
  }

  // Fungsi untuk mengambil data keranjang dari Firestore
  void fetchCartItems() async {
    try {
      final snapshot = await _firestore.collection('keranjang').get();
      // Map hasil snapshot ke dalam format list dan tambahkan ID dokumen
      cartItems.value = snapshot.docs.map((doc) {
        final data = doc.data();
        return {
          ...data,
          'id': doc.id,
          'isSelected': false, // Default tidak terpilih
          'selectedVariant': data['variants']?.isNotEmpty == true
              ? data['variants'][0]
              : null, // Variasi default
        };
      }).toList();
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengambil data keranjang: $e');
    }
  }

  // Fungsi untuk memperbarui jumlah item
  Future<void> updateItemQuantity(String id, int newQuantity) async {
    try {
      await _firestore.collection('keranjang').doc(id).update({
        'quantity': newQuantity,
      });
      fetchCartItems(); // Refresh data setelah update
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengubah jumlah item: $e');
    }
  }

  // Fungsi untuk menghapus item dari keranjang
  Future<void> deleteItem(String id) async {
    try {
      await _firestore.collection('keranjang').doc(id).delete();
      fetchCartItems(); // Refresh data setelah penghapusan
    } catch (e) {
      Get.snackbar('Error', 'Gagal menghapus item: $e');
    }
  }

  // Fungsi untuk toggle checkbox
  void toggleItemSelection(String id) {
    final index = cartItems.indexWhere((item) => item['id'] == id);
    if (index != -1) {
      cartItems[index]['isSelected'] =
          !(cartItems[index]['isSelected'] ?? false);
      cartItems.refresh(); // Memperbarui UI
    }
  }

  // Fungsi untuk memperbarui varian
  void updateItemVariant(String id, String? newVariant) {
    final index = cartItems.indexWhere((item) => item['id'] == id);
    if (index != -1 && newVariant != null) {
      cartItems[index]['selectedVariant'] = newVariant;
      cartItems.refresh(); // Memperbarui UI
    }
  }

  // Fungsi untuk menghitung total harga
  double get totalPrice => cartItems
      .where((item) => item['isSelected'] == true)
      .fold(0.0, (sum, item) => sum + (item['price'] * item['quantity']));
}
