import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class CustomCards extends StatefulWidget {
  const CustomCards({super.key});

  @override
  CustomCardsState createState() => CustomCardsState();
}

class CustomCardsState extends State<CustomCards> {
  List<String> _cardImages = [];

  @override
  void initState() {
    super.initState();
    _loadCardImages();
  }

  Future<void> _loadCardImages() async {
    try {
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);
      final List<String> paths = manifestMap.keys.where((String key) => key.contains('assets/cards/')).toList();

      setState(() {
        _cardImages = paths;
      });
    } catch (error) {
      print('Error loading card images: $error');
      // Handle error gracefully, e.g., show a placeholder image or retry loading.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 2.0),
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _cardImages.length,
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            margin: const EdgeInsets.all(2.0),
            child: Card(
              shape: const Border(),
              child: Center(
                child: Image.asset(
                  _cardImages[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
