import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Category {
  final String name;
  final String icon;
  final Color color;

  Category({@required this.name, @required this.icon, @required this.color});
}

List<Category> categories = <Category>[
  Category(
      name: 'Sports',
       color: Colors.orange, 
       icon: 'assets/icons/football.png'),
  Category(
      name: 'Travel', 
      color: Colors.cyan, 
      icon: 'assets/icons/travel.png'),

    Category(
   name: 'Gaming', 
   color: Colors.blue, 
   icon: 'assets/icons/gaming.png'),
    
    Category(
    name: 'Music', 
   color: Colors.red, 
  icon: 'assets/icons/music.png'),
   Category(
    name: 'Photo', 
  color: Colors.orange, 
  icon: 'assets/icons/camera.png'),
   Category(
  name: 'Food', 
  color: Colors.orange, 
  icon: 'assets/icons/groceries.png'),
   Category(
  name: 'Mosque', 
  color: Colors.orange, 
  icon: 'assets/icons/mosque.png'),
   Category(
  name: 'Puzzle', 
  color: Colors.orange, 
  icon: 'assets/icons/puzzle.png'),
];
