import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final ScrollController scrollController = ScrollController();

  CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 2.0),
      height: 80,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            margin: const EdgeInsets.all(2.0),
            child: Card(
              shape: const Border(),
              child: Center(
                child: Text('Card $index'),
              ),
            ),
          );
        },
      ),
    );
  }
}
