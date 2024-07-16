import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('note$soundNumber.wav'));
  }

  Expanded buildKey(
      {required int soundNumber, required Color color, required String note}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(soundNumber); // تشغيل الصوت بناءً على رقم الصوت
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0), // جعل الزر بزوايا مربعة
          ),
        ),
        child: Text(
          note,
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontFamily: 'Arial',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .stretch, // تجعل الأزرار تمتد عبر عرض الشاشة
              children: <Widget>[
                buildKey(soundNumber: 1, color: Colors.red, note: 'DO'),
                buildKey(soundNumber: 2, color: Colors.orange, note: 'RE'),
                buildKey(soundNumber: 3, color: Colors.yellow, note: 'MI'),
                buildKey(soundNumber: 4, color: Colors.green, note: 'FA'),
                buildKey(soundNumber: 5, color: Colors.teal, note: 'SOL'),
                buildKey(soundNumber: 6, color: Colors.blue, note: 'LA'),
                buildKey(soundNumber: 7, color: Colors.purple, note: 'SI'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
