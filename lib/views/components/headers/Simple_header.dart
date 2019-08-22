import 'package:flutter/material.dart';
//declaring and initializing date and day 
class SimpleHeader extends StatelessWidget {
  final String date;
  final String day;
  final double padding;

  const SimpleHeader(
      {Key key,
      @required this.date,
      @required this.day,
      @required this.padding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padding, right: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Text(date,
          style: TextStyle(fontSize: 13,color: Colors.grey),),
          Text(
            day,
            style: TextStyle(fontSize: 33, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
