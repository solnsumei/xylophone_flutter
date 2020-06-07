import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: XylophoneApp(),
      ),
    );
  }
}



class XylophoneApp extends StatelessWidget {

  Widget circleDot() {
    return CircleAvatar(
      radius: 5.0,
      backgroundColor: Colors.black,
    );
  }

  Widget buildTone({ Color color, int soundNumber, double width}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.0),
        width: width ?? double.infinity,
        child: FlatButton(
          color: color,
          shape: StadiumBorder(),
          onPressed: () {
            final player = AudioCache();
            player.play('note$soundNumber.wav');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              circleDot(),
              circleDot(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(),
          buildTone(
            width: appWidth * 0.95,
            color: Colors.red,
            soundNumber: 1,
          ),
          buildTone(
            width: appWidth * 0.9,
            color: Colors.orange,
            soundNumber: 2,
          ),
          buildTone(
              width: appWidth * 0.85,
              color: Colors.yellow,
              soundNumber: 3
          ),
          buildTone(
            width: appWidth * 0.8,
            color: Colors.green,
            soundNumber: 4,
          ),
          buildTone(
            width: appWidth * 0.75,
            color: Colors.teal,
            soundNumber: 5,
          ),
          buildTone(
            width: appWidth * 0.7,
            color: Colors.blue,
            soundNumber: 6,
          ),
          buildTone(
            width: appWidth * 0.65,
            color: Colors.purple,
            soundNumber: 7,
          ),
        ],
      ),
    );
  }
}
