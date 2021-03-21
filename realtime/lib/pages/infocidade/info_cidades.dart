import 'package:flutter/material.dart';

class InfoCidade extends StatelessWidget {
  BuildContext context;
  AsyncSnapshot snapshot;
  InfoCidade(this.context, this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            '${snapshot.data["results"]["city"]}',
            style: TextStyle(color: Colors.red),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            '${snapshot.data["results"]["forecast"][0]["description"]}',
            style: TextStyle(color: Colors.red),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            '${snapshot.data["results"]["forecast"][0]["max"]}',
            style: TextStyle(color: Colors.red),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            '${snapshot.data["results"]["forecast"][0]["min"]}',
            style: TextStyle(color: Colors.red),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            '${snapshot.data["results"]["forecast"][0]["weekday"]}',
            style: TextStyle(color: Colors.red),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            '${snapshot.data["results"]["forecast"][0]["min"]}',
            style: TextStyle(color: Colors.red),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            '${snapshot.data["results"]["forecast"][0]["min"]}',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
