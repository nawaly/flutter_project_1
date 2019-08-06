import 'package:flutter/material.dart';
import 'package:pt_project_1/views/screens/category_screen.dart';
import 'package:pt_project_1/views/screens/today_screens.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = <Widget>[
      TodayScreen(),
      CategoryScreen(
      ),
      Container(
        height: 400,
        color: Colors.yellowAccent,
      ),
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
      body: DefaultTabController(
          child: _screens.elementAt(_currentIndex), length: 5),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.red,
        currentIndex: _currentIndex,
        onTap: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.insert_comment,
              color: Colors.grey[600],
            ),
            title: Text('Today'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category, color: Colors.grey[600]),
              title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new, color: Colors.grey[600]),
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
    setState(() {
      _currentIndex = index;
    });
  }
}
