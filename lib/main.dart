import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:arcelik_flutter_app/views/homepage.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = true;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Arçelik Flutter App';

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.mPlusRounded1cTextTheme(baseTheme.textTheme,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: const MyHomePage(),
      theme: _buildTheme(Brightness.light),
    );
  }
}
