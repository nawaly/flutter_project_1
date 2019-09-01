import 'package:flutter/material.dart';
import 'package:pt_project_1/data/scoped_model/main.dart';
import 'package:pt_project_1/views/pages/post_page.dart';
import 'package:pt_project_1/views/screens/category_screen.dart';
import 'package:pt_project_1/views/screens/discover_screen.dart';
import 'package:pt_project_1/views/screens/search_screen.dart';
import 'package:pt_project_1/views/screens/today_screens.dart';

class HomePage extends StatefulWidget {
  final MainModel model;

  const HomePage({Key key, @required this.model}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //declarations and keys over here
  int _currentIndex = 0;
  // final MainModel _model=MainModel();
  

  _HomePageState();
@override
void initState() {
  widget.model.getAlbums();
// _model.getAlbums();
    super.initState();
  }
  @override
  
  Widget build(BuildContext context) { //builderContext iterates index
    //typecust is widget, takes anything in widget
    List<Widget> _screens = <Widget>[
      //private array name screen of type widget
      //screen pages classes which to be called
      TodayScreen(model: widget.model,),
      CategoryScreen(),
      DiscoverScreen(),
      SearchScreen(),
      // ProfileScreen(),
      PostPage(),
      Container(
        height: 400,
        color: Colors.blueAccent,
      ),
      Container(
        height: 400,
        color: Colors.greenAccent,
      ),
    ];
    return Scaffold( //Scaffold has app bar,body & bottomNavigationBar
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
