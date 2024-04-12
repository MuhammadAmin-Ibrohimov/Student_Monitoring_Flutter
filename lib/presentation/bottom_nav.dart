import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:monitoring/presentation/add_info.dart';
import 'package:monitoring/presentation/home.dart';
import 'package:monitoring/presentation/search.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTapIndex = 0;
  List<Widget> pages = [];
  late Home home;
  late Search search;
  late AddInfo addInfo;
  @override
  void initState() {
    home = Home();
    search = Search();
    addInfo = AddInfo();
    pages = [home, search, addInfo];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          onTap: (int index) {
            setState(() {
              currentTapIndex = index;
            });
          },
          color: Colors.black,
          backgroundColor: Colors.white,
          items: [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.search_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.add_circle_outline,
              color: Colors.white,
            ),
          ]),
      body: pages[currentTapIndex],
    );
  }
}
