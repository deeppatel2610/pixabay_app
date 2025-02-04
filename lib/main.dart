import 'package:flutter/material.dart';
import 'package:pixabay_app/provider/home_provider.dart';
import 'package:pixabay_app/screens/home_page.dart';
import 'package:pixabay_app/screens/search_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const HomePage(),
          '/search': (context) => const SearchPage(),
        },
      ),
    );
  }
}
