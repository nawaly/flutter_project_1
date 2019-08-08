import 'package:flutter/foundation.dart';

class Album{
final String cover; //cover picture
final String title; //heading
final String avatar; //profile
final String subtitle; //after heading information
final String author; //name of person
final int comments; //number of comments in the message icon
final bool isHot; //fire icon

  Album(
     {@required this.cover, 
    @required this.title, 
    @required this.avatar, 
    @required this.subtitle, 
    @required this.author, 
    @required this.comments, 
    @required this.isHot});
   
}
List<Album> albums = <Album>[
Album (
 author: 'Mozilla',
 avatar: 'assets/icons/1.jpg', 
 comments: 10, 
 cover: 'assets/icons/2.jpg', 
 isHot: true, 
 subtitle: 'Soprano Announces His New',
 title: 'GAMING'),

Album (
  author: 'nasss',
 avatar: 'assets/icons/2.jpg', 
 comments: 20, 
 cover: 'assets/icons/1.jpg', 
 isHot: false, 
 subtitle: 'tuesday',
 title: 'this two'),

 Album (
  author: 'navvv',
 avatar: 'assets/icons/1.jpg', 
 comments: 30, 
 cover: 'assets/icons/3.jpg', 
 isHot: false, 
 subtitle: 'wednesday',
 title: 'this three'),
];