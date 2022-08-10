import 'package:flutter/material.dart';
import 'package:vplayer/src/screens/gallery/video_card.dart';
import 'package:vplayer/src/config/const.dart';

class VideoList extends StatefulWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  updateUrl(newUrl) {
    print(newUrl);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: videoList.length,
        itemBuilder: (BuildContext context, int index) {
          return VideoCard(
              galleryItem: videoList[index], notifyParent: updateUrl);
        });
  }
}
