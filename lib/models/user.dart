import 'package:flutter/foundation.dart';
//creating user
class User {
  final String email;
  final int id;
  final String profile;
  final String name;
  final String token;
  User({ //constructor
    @required this.email,
    @required this.id,
    @required this.name,
    @required this.profile,
    @required this.token,
  });
  User.fromMap(
      Map<String, dynamic>
          map): // string is key that accepts strings and dynamic is value accepts values assert(map[id] != null), //assert inaikatalia app kuwa null
        assert(map['name'] != null),
        assert(map['email'] != null),
        assert(map['profile'] != null),
        assert(map['token'] != null), //logged in/active time
        
        id = map['id'],
        name = map['name'],
        email = map['email'],
        profile = map['profile'],
        token = map['token'];
}
