import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:vplayer/src/screens/gallery/controls.dart';
import 'package:vplayer/src/config/const.dart';

class VideoPlayerScreen extends StatefulWidget
{
  final String playVideo;
  const VideoPlayerScreen({Key? key, required this.playVideo}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.playVideo);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print('Player');
    print(widget.playVideo);
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Container(
            padding: const EdgeInsets.all(10),
            child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done)
                  {
                    return AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child:Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            VideoPlayer(_controller),
                            ClosedCaption(text: _controller.value.caption.text),
                            ControlsOverlay(controller: _controller),
                            VideoProgressIndicator(_controller, allowScrubbing: true),
                          ],
                        ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }))
      ]),
    );
  }
}
