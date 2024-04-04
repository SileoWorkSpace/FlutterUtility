import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: InkWell(
            onTap: () {
              // GoRouter.of(context).pushNamed(AppRouteName.page1Screen);
              context.go('/go_route_home/page1');
            },
            child: const Text("Home Screen")),
      )),
    );
  }
}
