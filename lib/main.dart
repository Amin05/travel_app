import 'package:flutter/material.dart';
import 'package:travel_app/pages/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/pages/preview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.dmSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: PreviewPage(),
    );
  }
}
