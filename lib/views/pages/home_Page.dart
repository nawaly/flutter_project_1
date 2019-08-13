import 'package:flutter/material.dart';
import 'package:pt_project_1/views/screens/category_screen.dart';
import 'package:pt_project_1/views/screens/discover_screen.dart';
import 'package:pt_project_1/views/screens/today_screens.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //declarations and keys over here
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) { //builderContext iterates index
    //typecust is widget, takes anything in widget
    List<Widget> _screens = <Widget>[
      //private array name screen of type widget
      //screen pages classes which to be called
      TodayScreen(),
      CategoryScreen(),
      DiscoverScreen(),
      Container(
        height: 400,
        color: Colors.blueAccent,
      ),
      Container(
        height: 400,
        color: Colors.greenAccent,
      ),
    ];
    return Scaffold(
      body: DefaultTabController( //defaulttabcontroller is widget
          child: _screens.elementAt(_currentIndex), length: 5), //elementAt takes current index
      bottomNavigationBar: BottomNavigationBar(
        // bar of the bottom and the top one is UpBar
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.red,
        currentIndex: _currentIndex,
        onTap: _selectedIndex, //ontap is method for button to be clickable
        items: <BottomNavigationBarItem>[
          //item is an array of type bottomnavigationbar
          BottomNavigationBarItem(
            icon: Icon(
              Icons.insert_comment,
              color: Colors.grey[600],
            ),
            title: Text('Today'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.content_copy, color: Colors.grey[600]),
              title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star, color: Colors.grey[600]),
              title: Text('Discover')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.grey[600]),
              title: Text('Search')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.grey[600]),
              title: Text('Profile')),
        ],
      ),
    );
  }

  void _selectedIndex(int index) {
    setState(() { //setstate takes current index 
      _currentIndex = index;
    });
  }
}
