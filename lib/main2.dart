import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  Map<String, bool> expansionMap = {};

  @override
  void initState() {
    super.initState();
    for (String item in items) {
      expansionMap[item] = false;
    }
  }

  void toggleExpansion(String item) {
    setState(() {
      expansionMap[item] = !expansionMap[item]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clickable List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          String currentItem = items[index];
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(currentItem),
                onTap: () {
                  toggleExpansion(currentItem);
                },
              ),
              if (expansionMap[currentItem]!)
                Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('${currentItem} - Sub-item 1'),
                    ),
                    ListTile(
                      title: Text('${currentItem} - Sub-item 2'),
                    ),
                    ListTile(
                      title: Text('${currentItem} - Sub-item 3'),
                    ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
