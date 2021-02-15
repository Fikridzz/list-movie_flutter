import 'package:flutter/material.dart';

class DetailMovie extends StatelessWidget {
  DetailMovie({this.title, this.image, this.desc});

  final String title;
  final String image;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail movie"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16.0),
                child: Hero(
                  tag: image,
                  child: Image.asset(
                    'images/$image',
                    width: 240,
                    height: 320,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  desc,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
