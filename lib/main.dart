import 'package:flutter/material.dart';
import 'package:flutterutility/hero_animation/hero_page_one.dart';
import 'package:flutterutility/sliver_app/sliver_app_bar_video.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Flutter Utility"),
        ),
        body: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // number of items in each row
              mainAxisSpacing: 8.0, // spacing between rows
              crossAxisSpacing: 8.0, // spacing between columns
            ),
            padding: const EdgeInsets.all(18),
            // itemCount: ,
            children: [
              gridItem("Hero animation", Icons.animation, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HeroPageOne()));
              }),
              gridItem("Sliver App Video", Icons.video_collection_rounded, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SliverVideo()));
              }),
            ]));
  }

  Widget gridItem(String name, IconData iconData, dynamic navigate) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: navigate,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              iconData,
              size: 36,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(height: 1.1),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
