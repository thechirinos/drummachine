import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:math';

void main() => runApp(MyApp());

AudioCache player = new AudioCache();

void _onClicked(String filename) {
  player.play("$filename.mp3");
}

List data = [
  'KICK',
  'TAP',
  'SNARE',
  'CLAPZ',
  'BOOM',
  'HIHAT',
  'GUN',
  'CLAP',
  'BASS 1',
  'BASS 2',
  'ROBOT',
  'VOX',
  'PIANO',
  'WAR',
  'LISTEN',
  'SUB',
];

class MyApp extends StatelessWidget {
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Drum Machine'),
          backgroundColor: Colors.blueGrey,
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return GridView.builder(
              itemCount: data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: orientation == Orientation.portrait ? 3 : 6),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onLongPress: () => debugPrint("TEST"),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: RaisedButton(
                        child: Text(data[index]),
                        color: Colors.white,
                        splashColor: Color(
                                (Random().nextDouble() * 0xFFFFFF).toInt() << 0)
                            .withOpacity(1.0),
                        onPressed: () => _onClicked(data[index]),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
