import 'package:flutter/material.dart';

class SimpleHeaders extends StatelessWidget {
  final String title;
  final String subtitle;
  final double padding;
  final bool showTitle;
  final bool showButton;
  final bool showStar;
// showTitle & showSubtitle may or may not be there, thats why not @required
  const SimpleHeaders(
      {Key key,
      this.title,
      @required this.subtitle,
      @required this.padding,
      this.showButton,
      this.showTitle, 
      this.showStar})
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
          showTitle ? Text(title) : Container(),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  subtitle,
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
                ),
              ),
              showButton
                  ? RaisedButton(
                      color: Color(0xffD4AF37),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(left:25,right: 25),
                        child: Text('SEE ALL',
                            style: TextStyle(color: Colors.white)),
                      ),
                      onPressed: () {},
                    )
                  : Container(),
                  showStar ?
                  Icon(
                    Icons.star,
                  color: Colors.blue,
                  size: 40,
                  )
                 : Container(),
            ],
          ),
          SizedBox(
            height: 8, //height from star to image
          ),
        ],
      ),
    );
  }
}
