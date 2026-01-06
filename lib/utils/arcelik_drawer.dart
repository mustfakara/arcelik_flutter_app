import 'package:flutter/material.dart';
import 'package:arcelik_flutter_app/utils/custom_cards.dart';
import 'package:arcelik_flutter_app/utils/custom_list_items.dart';
import 'drawer_list_item.dart';

class ArcelikDrawer extends StatelessWidget {
  const ArcelikDrawer({super.key});

  // Define list of drawer items
  static List<Map<String, dynamic>> drawerItems = [
    {'title': 'Kampanyalar', 'onTap': () => print('Navigate to Kampanyalar page')},
    {'title': 'Teknolojiler', 'onTap': () => print('Navigate to Teknolojiler page')},
    {'title': 'Mucize Lezzetler', 'onTap': () => print('Navigate to Mucize Lezzetler page')},
    {'title': 'Destek', 'onTap': () => print('Navigate to Destek page')},
    {'title': 'Kurumsal', 'onTap': () => print('Navigate to Kurumsal page')},
    {'title': 'Arçelik Mağazaları', 'onTap': () => print('Navigate to Arçelik Mağazaları page')},
    {'title': 'Yetkili Servisler', 'onTap': () => print('Navigate to Yetkili Servisler page')},
    {'title': 'Çağrı Merkezi', 'onTap': () => print('Navigate to Çağrı Merkezi page')},
    {'title': 'Servis Randevusu', 'onTap': () => print('Navigate to Servis Randevusu page')},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // First Row: Login/Sign Up Text and Back Button
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Bold Puntos and Login/Sign Up Text
                    const Row(
                      children: <Widget>[
                        Text(
                          'Login / Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                    // Back Button
                    SizedBox(
                      width: 45,
                      height: 30,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Divider(color: Colors.grey.withOpacity(0.25)),
              ),
              // Second Row: Rounded Gray Search Bar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.grey[300],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for product, category, service, store',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ),

              const CustomCards(),

              // ExpandableContainer
              const ExpandableContainer(),

              // List Items using ListView.builder
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: drawerItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return DrawerListItem(
                    title: drawerItems[index]['title'],
                    onTap: drawerItems[index]['onTap'],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
