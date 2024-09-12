import 'package:flutter/material.dart';
import 'package:readsphere/screens/home_page.dart';

void main() {
  runApp(const ReadSphere());
}

class ReadSphere extends StatelessWidget {
  const ReadSphere({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => const HomePage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
