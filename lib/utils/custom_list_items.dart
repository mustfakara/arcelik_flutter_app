import 'package:flutter/material.dart';

class ExpandableContainer extends StatefulWidget {
  const ExpandableContainer({super.key});

  @override
  ExpandableContainerState createState() => ExpandableContainerState();
}

class ExpandableContainerState extends State<ExpandableContainer> {
  String? selectedCategory;

  final Map<String, List<String>> categories = {
    'Fridges': ['No Frost', 'Mini', 'Double Door'],
    'Laundries': ['Front Load', 'Top Load', 'Compact'],
    'Ovens': ['Convection', 'Microwave', 'Grill'],
  };

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.only(
          left: 2.0, right: 4.0), // Increased left padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              if (selectedCategory != null) ...[
                const Padding(padding: EdgeInsets.only(left: 12.0)),
                IconButton(
                  key: const ValueKey('backButton'),
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      selectedCategory = null;
                    });
                  },
                ),
                const SizedBox(
                    width: 8.0), // Added space between back button and text
                Text(
                  selectedCategory!,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: selectedCategory == null
                ? Column(
                    key: const ValueKey('primaryList'),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: categories.keys.map((category) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            trailing: const Icon(Icons.chevron_right),
                            dense: true, // Reduce height of ListTile
                            title: Text(
                              category,
                              style: const TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selectedCategory = category;
                              });
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16.0),
                            child:
                                Divider(color: Colors.grey.withOpacity(0.25)),
                          ),
                        ],
                      );
                    }).toList(),
                  )
                : Column(
                    key: const ValueKey('subList'),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: categories[selectedCategory]!.map((subItem) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            trailing: const Icon(Icons.add),
                            dense: true, // Reduce height of ListTile
                            title: Text(
                              subItem,
                              style: const TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16.0),
                            child:
                                Divider(color: Colors.grey.withOpacity(0.25)),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
          ),
        ],
      ),
    );
  }
}
