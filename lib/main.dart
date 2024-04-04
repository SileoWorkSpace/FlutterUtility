import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutterutility/go_route/router/app_route_config.dart';
import 'package:flutterutility/go_route/router/app_route_name.dart';
import 'package:flutterutility/hero_animation/hero_page_one.dart';
import 'package:flutterutility/sliver_app/sliver_app_bar_video.dart';
import 'package:flutterutility/speech_to_text/speech_to_text_search.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_actions/quick_actions.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: MyAppRoute().router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
  QuickActions quickActions = const QuickActions();

  @override
  void initState() {
    super.initState();
    quickActions.initialize((String shortcutType) {
      if (shortcutType == 'hero_animation') {
        GoRouter.of(context).pushNamed(AppRouteName.heroAnimationScreen);
      }
      if (shortcutType == 'speech_to_text') {
        GoRouter.of(context).pushNamed(AppRouteName.speechToTextScreen);
      }
    });

    quickActions.setShortcutItems([
      const ShortcutItem(
          type: 'hero_animation',
          localizedTitle: 'Hero animation',
          icon: "icon1"),
      const ShortcutItem(
          type: 'speech_to_text',
          localizedTitle: 'Speech To Text',
          icon: "icon1"),
    ]);
  }

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
                GoRouter.of(context)
                    .pushNamed(AppRouteName.heroAnimationScreen);
              }),
              gridItem("Sliver App Video", Icons.video_collection_rounded, () {
                GoRouter.of(context)
                    .pushNamed(AppRouteName.sliverAppVideoScreen);
              }),
              gridItem("Speech To Text", Icons.record_voice_over_rounded,
                  () async {
                GoRouter.of(context).pushNamed(AppRouteName.speechToTextScreen);
              }),
              gridItem("SOS Direct Calling", Icons.call, () async {
                FlutterPhoneDirectCaller.callNumber("8630463472");
              }),
              gridItem("Go Route", Icons.navigation, () async {
                GoRouter.of(context).pushNamed(AppRouteName.goRouteHomeScreen);
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
