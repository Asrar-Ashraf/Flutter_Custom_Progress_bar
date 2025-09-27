import 'package:flutter/material.dart';
import 'package:flutter_animation_practice/progressbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final Size(:width, :height) = size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
        backgroundColor: Colors.cyanAccent,
        leading: Icon(Icons.back_hand),
      ),
      backgroundColor: Colors.black,
      body: Stack(children: [Progressbar(boxsize: 15)]),
    );
  }
}
