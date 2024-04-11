import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutterutility/go_route/router/app_route_config.dart';
import 'package:flutterutility/go_route/router/app_route_name.dart';
import 'package:flutterutility/hero_animation/hero_page_one.dart';
import 'package:flutterutility/map/map_view.dart';
import 'package:flutterutility/sliver_app/sliver_app_bar_video.dart';
import 'package:flutterutility/speech_to_text/speech_to_text_search.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyAVjI9pshKI320B9D0LxSN9St7onAfJgeE',
    appId: '1:608233040494:android:bce3855bac9cc8c4bc147f',
    messagingSenderId: '608233040494',
    projectId: 'flutterutility',
    storageBucket: 'flutterutility.appspot.com',
  ));
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

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    // Getting users credential
    UserCredential result = await auth.signInWithCredential(authCredential);
    User user = result.user!;

    log(jsonEncode(result.toString()));
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => HomePage()));
    // if result not null we simply call the MaterialpageRoute,
    // for go to the HomePage screen
  }

  Future<UserCredential> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.success) {
        final AccessToken accessToken = loginResult.accessToken!;
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);
        return await FirebaseAuth.instance.signInWithCredential(credential);
      } else {
        throw FirebaseAuthException(
          code: 'Facebook Login Failed',
          message: 'The Facebook login was not successful.',
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle Firebase authentication exceptions
      log('Firebase Auth Exception: ${e.message}');
      rethrow; // rethrow the exception
    } catch (e) {
      // Handle other exceptions
      log('Other Exception: $e');
      rethrow; // rethrow the exception
    }
  }

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
