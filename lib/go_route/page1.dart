import 'package:flutter/material.dart';
import 'package:flutterutility/go_route/router/app_route_name.dart';
import 'package:go_router/go_router.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InkWell(
            onTap: () {
              GoRouter.of(context).pushNamed(AppRouteName.page2Screen);
            },
            child: const Text("Page 1 Screen")),
      ),
    );
  }
}
