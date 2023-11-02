import 'package:flutter/material.dart';
import 'package:movies/ui/browse/BrowseTab.dart';
import 'package:movies/ui/home/HomeTab.dart';
import 'package:movies/ui/search/SearchTab.dart';
import 'package:movies/ui/watchList/WatchListTab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
  HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchListTab(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    bottomNavigationBar: BottomNavigationBar(
      onTap: (index){
        setState(() {
          selectedIndex =index;

        });
      },
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'
            ,backgroundColor: Theme.of(context).primaryColor),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'
            ,backgroundColor: Theme.of(context).primaryColor),
        BottomNavigationBarItem(icon: Icon(Icons.movie),label: 'Browse'
            ,backgroundColor: Theme.of(context).primaryColor),
        BottomNavigationBarItem(icon: Icon(Icons.book),label: 'Watch List'
        ,backgroundColor: Theme.of(context).primaryColor
        ),
      ],
    ),
      body: Column(
        children: [
          Expanded(child: tabs[selectedIndex]),
          Container(width: double.infinity,height: 8,decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFF232323),
              Theme.of(context).primaryColor],begin: Alignment.topCenter,end: Alignment.bottomCenter)
          ),)
        ],
      ),
    );
  }
}
