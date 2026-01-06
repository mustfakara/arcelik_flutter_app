// arcelik_appbar.dart
import 'package:flutter/material.dart';

class ArcelikAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ValueNotifier<bool> isScrolledNotifier;

  const ArcelikAppBar({super.key, required this.isScrolledNotifier});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isScrolledNotifier,
      builder: (context, isScrolled, child) {
        return AppBar(
          backgroundColor: isScrolled ? Colors.white : Colors.transparent,
          elevation: 0,
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 48.0),
              child: Image.asset(
                'assets/logos/arcelik_logo.png',
                height: 25, // Adjust logo size as needed
                color: isScrolled ? null : Colors.white,
              ),
            ),
          ),
          iconTheme: IconThemeData(color: isScrolled ? Colors.black : Colors.white),
          flexibleSpace: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            color: isScrolled ? Colors.white : Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const SizedBox.shrink(),
                        onPressed: () {
                          // Handle drawer icon press
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.notifications),
                        onPressed: () {
                          // Handle notifications icon press
                        },
                        color: isScrolled ? Colors.black : Colors.white,
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          // Handle search icon press
                        },
                        color: isScrolled ? Colors.black : Colors.white,
                      ),
                      IconButton(
                        icon: const Icon(Icons.shopping_cart),
                        onPressed: () {
                          // Handle shopping cart icon press
                        },
                        color: isScrolled ? Colors.black : Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(42);
}
