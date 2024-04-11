import 'package:flutter/material.dart';
import 'package:flutterutility/go_route/go_route_home_screen.dart';
import 'package:flutterutility/go_route/page1.dart';
import 'package:flutterutility/go_route/page2.dart';
import 'package:flutterutility/go_route/router/app_route_name.dart';
import 'package:flutterutility/hero_animation/hero_page_one.dart';
import 'package:flutterutility/main.dart';
import 'package:flutterutility/sliver_app/sliver_app_bar_video.dart';
import 'package:flutterutility/speech_to_text/speech_to_text_search.dart';
import 'package:go_router/go_router.dart';

class MyAppRoute {
  GoRouter router = GoRouter(initialLocation: "/", routes: [
    GoRoute(
        name: AppRouteName.utilityScreen,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(
              child: MyHomePage(title: 'Flutter Demo Home Page'));
        },
        routes: [
          GoRoute(
            name: AppRouteName.heroAnimationScreen,
            path: 'hero_animation',
            pageBuilder: (context, state) {
              return const MaterialPage(child: HeroPageOne());
            },
          ),
          GoRoute(
            name: AppRouteName.speechToTextScreen,
            path: 'speech_to_text',
            pageBuilder: (context, state) {
              return const MaterialPage(child: SpeechToTextSearch());
            },
          ),
          GoRoute(
            name: AppRouteName.sliverAppVideoScreen,
            path: 'sliver_app_video',
            pageBuilder: (context, state) {
              return const MaterialPage(child: SliverVideo());
            },
          ),
          GoRoute(
              name: AppRouteName.goRouteHomeScreen,
              path: 'go_route_home',
              pageBuilder: (context, state) {
                return const MaterialPage(child: GoRouteHomeScreen());
              },
              routes: [
                GoRoute(
                  name: AppRouteName.page1Screen,
                  path: 'page1',
                  pageBuilder: (context, state) {
                    return const MaterialPage(child: Page1());
                  },
                ),
                GoRoute(
                  name: AppRouteName.page2Screen,
                  path: 'page2',
                  pageBuilder: (context, state) {
                    return const MaterialPage(child: Page2());
                  },
                ),
              ]),
        ]),
  ]);
}
