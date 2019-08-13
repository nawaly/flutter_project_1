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
 author: 'Naw',
 avatar: 'assets/icons/1.jpg', 
 comments: 10, 
 cover: 'assets/icons/2.jpg', 
 isHot: true, 
 subtitle: 'Monday',
 title: 'One'),

Album (
  author: 'Nas',
 avatar: 'assets/icons/2.jpg', 
 comments: 20, 
 cover: 'assets/icons/1.jpg', 
 isHot: false, 
 subtitle: 'Tuesday',
 title: 'this two'),

 Album (
  author: 'Nav',
 avatar: 'assets/icons/1.jpg', 
 comments: 30, 
 cover: 'assets/icons/3.jpg', 
 isHot: false, 
 subtitle: 'Wednesday',
 title: 'this three'),

 Album (
  author: 'Naj',
 avatar: 'assets/icons/2.jpg', 
 comments: 20, 
 cover: 'assets/icons/1.jpg', 
 isHot: false, 
 subtitle: 'Thursday',
 title: 'this Four'),

Album (
  author: 'Nar',
 avatar: 'assets/icons/3.jpg', 
 comments: 20, 
 cover: 'assets/icons/1.jpg', 
 isHot: false, 
 subtitle: 'Friday',
 title: 'five'),

Album (
  author: 'Nad',
 avatar: 'assets/icons/2.jpg', 
 comments: 20, 
 cover: 'assets/icons/3.jpg', 
 isHot: false, 
 subtitle: 'Saturday',
 title: 'this Six'),

];