import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = "XXXXXXXX";
  final String subtitle = "XXX";
  final int starCount = 41;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget img1 = new Container(
      child: new Image(
        image: new AssetImage("images/lake.jpg"),
        fit: BoxFit.cover,
      ),
    );

    Widget s1 = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  "Oeschinen Lake Campground",
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Text(
                "Kandersteg, Switzerland",
                style: new TextStyle(color: Colors.grey[500]),
              ),
            ],
          )),
         new FavoriteStarWidget(),
        ],
      ),
    );

    Column buildBt(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(
            icon,
            color: color,
          ),
          new Container(
              margin: EdgeInsets.only(top: 8.0),
              child: new Text(
                label,
                style: new TextStyle(
                    color: color, fontSize: 12.0, fontWeight: FontWeight.w700),
              ))
        ],
      );
    }

    Widget bt1 = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          buildBt(Icons.call, "CALL"),
          buildBt(Icons.near_me, "ROUTE"),
          buildBt(Icons.share, "SHARE"),
        ],
      ),
    );

    Widget text1 = new Container(
      padding: EdgeInsets.all(32.0),
      child: new Text(
        '''Lake Oeschinen lies at the foot of the Bl¨¹emlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.''',
        softWrap: true,
      ),
    );

    return new MaterialApp(
        title: "Test_flutter_first_app",
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new Scaffold(
          body: new ListView(
            children: <Widget>[img1, s1, bt1, text1],
          ),
        ));
  }
}

class FavoriteStarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FavoriteStar();
}

class _FavoriteStar extends State<FavoriteStarWidget> {
  bool _b = false;
  int starNumbers = 33;

  void _toggleStar() {
    setState(() {
      if (_b) {
        starNumbers--;
        _b = false;
      } else {
        starNumbers++;
        _b = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
              icon: _b ? new Icon(Icons.star) : new Icon(Icons.star_border),
              color: Colors.red[500],
              onPressed: _toggleStar),
        ),
        new SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text("$starNumbers"),
          ),
        )
      ],
    );
  }
}
