// homepage.dart
import 'package:flutter/material.dart';
import 'package:arcelik_flutter_app/utils/arcelik_drawer.dart';
import 'package:arcelik_flutter_app/utils/arcelik_appbar.dart';
import 'package:arcelik_flutter_app/views/mainpage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final ValueNotifier<bool> isScrolledNotifier = ValueNotifier(false);

  @override
  void dispose() {
    isScrolledNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ArcelikAppBar(isScrolledNotifier: isScrolledNotifier), // Pass the notifier
        body: MainPage(isScrolledNotifier: isScrolledNotifier), // Pass the notifier
        drawer: const ArcelikDrawer(),
      ),
    );
  }
}
