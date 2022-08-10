import 'package:flutter/material.dart';
import 'package:vplayer/src/screens/gallery/player.dart';
import 'package:vplayer/src/screens/gallery/video_card.dart';
import 'package:vplayer/src/config/const.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  String playVideo = 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';
  updateUrl(newUrl) {
    setState(() {
      playVideo = newUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 250.0,
                    alignment: Alignment.center,
                    child: VideoPlayerScreen(playVideo:playVideo),
                  ),
                  Expanded(
                    child: Container(
                      height: 520.0,
                      alignment: Alignment.center,
                      child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: videoList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return VideoCard(galleryItem: videoList[index],notifyParent: updateUrl);
                          })
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
