import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.put(PaymentController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: GoogleFonts.poppins(
            textStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Address Section
            ListTile(
              title: Text(
                'Alamat Kayungyun kamu',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Text(
                'Satria Milan W\nJl. Tlogo Al-Kautsar No.99, Tlogomas, Kec. Lowokwaru',
                style: GoogleFonts.poppins(fontSize: 14),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
            ),
            const Divider(),
            // Promo Section
            Card(
              color: Colors.green[50],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '1 kupon promo berhasil dipakai\nDapat diskon Rp20.000',
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Payment Method Section
            ListTile(
              title: Text(
                'Metode pembayaran',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Row(
                children: [
                  Icon(Icons.account_balance, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(
                    'Cash/ Bayar Tunai',
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                ],
              ),
            ),
            const Divider(),

            // Transaction Summary
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cek ringkasan transaksimu, yuk',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                Obx(() {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Harga (1 Barang)',
                              style: GoogleFonts.poppins(fontSize: 14)),
                          Text(
                            'Rp${controller.totalPayment.toStringAsFixed(0)}',
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Biaya Aplikasi (Diskon)',
                              style: GoogleFonts.poppins(fontSize: 14)),
                          Text('Rp0', style: GoogleFonts.poppins(fontSize: 14)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Pembayaran',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            'Rp${(controller.totalPayment.value + 1000).toStringAsFixed(0)}',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ],
            ),

            const SizedBox(height: 16),

            // Pay Button
            Obx(() {
              return ElevatedButton(
                onPressed: controller.totalPayment.value > 0
                    ? () {
                        controller.processPayment();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Bayar Sekarang',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
