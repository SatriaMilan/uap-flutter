import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // Untuk memformat tanggal

class AkstivitasController extends GetxController {
  var transactions = <Map<String, dynamic>>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchAllTransactions(); // Ambil semua transaksi saat controller pertama kali diinisialisasi
  }

  // Fungsi untuk mengambil semua transaksi
  Future<void> fetchAllTransactions() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('transactions')
          .orderBy('timestamp', descending: true)
          .get();

      transactions.value = snapshot.docs
          .map((doc) => doc.data())
          .toList(); // Mengambil data transaksi
    } catch (e) {
      print('Gagal mengambil transaksi: $e');
    }
  }

  // Fungsi untuk memfilter transaksi berdasarkan hari ini
  Future<void> filterByToday() async {
    final todayStart =
        DateTime.now().subtract(Duration(days: 1)); // Waktu mulai hari ini
    final snapshot = await FirebaseFirestore.instance
        .collection('transactions')
        .where('timestamp', isGreaterThanOrEqualTo: todayStart)
        .orderBy('timestamp', descending: true)
        .get();

    transactions.value = snapshot.docs.map((doc) => doc.data()).toList();
  }

  // Fungsi untuk memfilter transaksi berdasarkan 1 jam terakhir
  Future<void> filterByLastHour() async {
    final oneHourAgo =
        DateTime.now().subtract(Duration(hours: 1)); // Waktu 1 jam yang lalu
    final snapshot = await FirebaseFirestore.instance
        .collection('transactions')
        .where('timestamp', isGreaterThanOrEqualTo: oneHourAgo)
        .orderBy('timestamp', descending: true)
        .get();

    transactions.value = snapshot.docs.map((doc) => doc.data()).toList();
  }
}
