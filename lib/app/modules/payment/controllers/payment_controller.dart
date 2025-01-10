import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/keranjang/controllers/keranjang_controller.dart';
// import 'keranjang_controller.dart';

class PaymentController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final KeranjangController keranjangController =
      Get.find<KeranjangController>();
      

  // Objek observasi untuk total pembayaran
  var totalPayment = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    calculateTotalPayment(); // Hitung total pembayaran saat controller diinisialisasi
  }

  // Fungsi untuk menghitung total pembayaran berdasarkan item yang dipilih
  void calculateTotalPayment() {
    totalPayment.value = keranjangController.cartItems
        .where((item) => item['isSelected'] == true)
        .fold(0.0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  // Fungsi untuk melakukan pembayaran
  Future<void> processPayment() async {
    try {
      // Ambil item yang dipilih
      final selectedItems = keranjangController.cartItems
          .where((item) => item['isSelected'] == true)
          .toList();

      if (selectedItems.isEmpty) {
        Get.snackbar('Error', 'Tidak ada item yang dipilih untuk pembayaran.');
        return;
      }

      // Simpan transaksi ke Firestore
      final transactionData = {
        'items': selectedItems
            .map((item) => {
                  'name': item['name'],
                  'quantity': item['quantity'],
                  'price': item['price'],
                  'total': item['quantity'] * item['price'],
                })
            .toList(),
        'totalPayment': totalPayment.value,
        'status': 'Paid',
        'timestamp': FieldValue.serverTimestamp(),
      };

      await _firestore.collection('transactions').add(transactionData);

      // Tandai item sebagai dibayar dan hapus dari keranjang
      for (var item in selectedItems) {
        await keranjangController.deleteItem(item['id']);
      }

      // Refresh keranjang
      keranjangController.fetchCartItems();
      calculateTotalPayment();

      // Navigasi ke halaman aktivitas
      Get.offNamed('/aktivitas');
      Get.snackbar('Sukses', 'Pembayaran berhasil dilakukan.');
    } catch (e) {
      Get.snackbar('Error', 'Gagal memproses pembayaran: $e');
    }
  }
}
