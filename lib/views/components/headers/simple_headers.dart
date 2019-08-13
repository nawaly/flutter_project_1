import 'package:flutter/material.dart';

class SimpleHeaders extends StatelessWidget {
  final String title;
  final String subtitle;
  final double padding;
  final bool showTitle;
  final bool showButton;

  const SimpleHeaders(
      {Key key,
      this.title,
      @required this.subtitle,
      @required this.padding,

      TextStyle style, this.showButton, this.showTitle})
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
          showTitle?
          Text(title):Container(),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  subtitle,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              showButton ? 
              RaisedButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Text('SEE ALL', style: TextStyle(color: Colors.white)),
                onPressed: () {},
              ):Icon(Icons.star, color: Colors.blue, size: 40,),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
