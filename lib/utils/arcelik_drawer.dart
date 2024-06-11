import 'package:flutter/material.dart';
import 'package:arcelik_flutter_app/utils/custom_cards.dart';
import 'package:arcelik_flutter_app/utils/custom_list_items.dart';

class ArcelikDrawer extends StatelessWidget {
  const ArcelikDrawer({super.key});

//   @override
//   State<ArcelikDrawer> createState() => _ArcelikDrawerState();
// }

// class _ArcelikDrawerState extends State<ArcelikDrawer> {
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.white,
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
                        'Giriş Yap / Üye Ol',
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
                  hintText: 'Ürün, kategori, servis, mağaza ara',
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

            CustomCards(),
            const ExpandableContainer(),

            const ListTile(
              title: Text('Further Options will be here...'),
            ),
          ],
        ),
      ),
    );
  }
}
