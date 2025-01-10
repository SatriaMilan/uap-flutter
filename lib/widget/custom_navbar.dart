import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        print("Tapped index: $index");
        print("CustomNavbar: currentIndex = $currentIndex");

        onTap(index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_offer),
          label: 'Promo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Aktivitas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: const Color.fromARGB(255, 35, 142, 89),
      unselectedItemColor: const Color.fromARGB(255, 70, 70, 70),
      showUnselectedLabels: true,
    );
  }
}
