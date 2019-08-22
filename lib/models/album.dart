import 'package:flutter/foundation.dart';
//model is blue print of album
//album model declares and initializes user's details
class Album{
final String cover; //cover picture
final String title; //heading
final String subtitle; //after heading information
final bool isHot;
final int authorId;
final String details;

  Album({
   @required this.cover,
   @required this.title,
   @required this.authorId,
   @required this.subtitle, 
   @required this.details, 
   @required this.isHot});

    Album.fromMap(Map<String, dynamic> map)
      : 
        assert(map['cover'] != null),
        assert(map['title'] != null),
        assert(map['authorId'] != null),
        assert(map['subtitle'] != null),
        assert(map['detals'] != null),
        assert(map['isHot'] != null),

        cover = map['cover'],
        title = map['title'],
        authorId = map['authorId'],
        subtitle = map['subtitle'],
        details = map['details'],
        isHot = map['isHot'];
}

// List<Album> albums = <Album>[
// Album (
//  author: 'Naw',
//  avatar: 'assets/icons/1.jpg', 
//  comments: 10, 
//  cover: 'assets/icons/2.jpg', 
//  isHot: true, 
//  subtitle: 'Monday',
//  title: 'One'),

// Album (
//   author: 'Nas',
//  avatar: 'assets/icons/2.jpg', 
//  comments: 20, 
//  cover: 'assets/icons/1.jpg', 
//  isHot: false, 
//  subtitle: 'Tuesday',
//  title: 'this two'),

//  Album (
//   author: 'Nav',
//  avatar: 'assets/icons/1.jpg', 
//  comments: 30, 
//  cover: 'assets/icons/3.jpg', 
//  isHot: false, 
//  subtitle: 'Wednesday',
//  title: 'this three'),

//  Album (
//   author: 'Naj',
//  avatar: 'assets/icons/2.jpg', 
//  comments: 20, 
//  cover: 'assets/icons/1.jpg', 
//  isHot: false, 
//  subtitle: 'Thursday',
//  title: 'this Four'),

// Album (
//   author: 'Nar',
//  avatar: 'assets/icons/3.jpg', 
//  comments: 20, 
//  cover: 'assets/icons/1.jpg', 
//  isHot: false, 
//  subtitle: 'Friday',
//  title: 'five'),

// Album (
//   author: 'Nad',
//  avatar: 'assets/icons/2.jpg', 
//  comments: 20, 
//  cover: 'assets/icons/3.jpg', 
//  isHot: false, 
//  subtitle: 'Saturday',
//  title: 'this Six'),

// ];