import 'package:flutter/material.dart';
import 'package:arcelik_flutter_app/utils/arcelik_appbar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // int _selectedIndex = 0; // Ana Sayfa
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          appBar: ArcelikAppBar(), // Inside of utils folder
          body: null,
          drawer: null
          // Inside of utils folder
          ),
    );
  }
}
