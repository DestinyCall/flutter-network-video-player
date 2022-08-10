import 'package:flutter/material.dart';
import 'package:vplayer/src/config/const.dart';
import 'package:vplayer/src/screens/Main/main.dart';

class XPlayer extends StatelessWidget {
  const XPlayer({Key? key}) : super(key: key);
  static const String _title = 'X-Video Player';
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        fontFamily: 'NoirPro',
        primarySwatch: primarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Main()
      ),
    );
  }
}