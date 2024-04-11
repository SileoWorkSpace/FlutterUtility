import 'package:flutter/material.dart';
import 'package:flutterutility/go_route/home.dart';
import 'package:flutterutility/go_route/map.dart';
import 'package:flutterutility/go_route/reviews.dart';
import 'package:flutterutility/go_route/search.dart';

class GoRouteHomeScreen extends StatefulWidget {
  const GoRouteHomeScreen({super.key});

  @override
  State<GoRouteHomeScreen> createState() => _GoRouteHomeScreenState();
}

class _GoRouteHomeScreenState extends State<GoRouteHomeScreen> {
  int _selectedIndex = 0;
  final List _screens = [
    const Home(),
    const MapScreen(),
    const Search(),
    const Reviews()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.reviews), label: "Reviews"),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: _screens.elementAt(_selectedIndex),
    );
  }
}
