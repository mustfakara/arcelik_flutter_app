import 'package:flutter/material.dart';

class ArcelikAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ArcelikAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    // Çekmece iconuna basıldığında yapılacak işlemler
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    // Bildirim iconuna basıldığında yapılacak işlemler
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/logos/arcelik_logo3.png',
              height: 30, // İstediğiniz logo boyutunu ayarlayabilirsiniz
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Arama iconuna basıldığında yapılacak işlemler
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    // Sepet iconuna basıldığında yapılacak işlemler
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
