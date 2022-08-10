import 'package:flutter/material.dart';
import 'package:vplayer/src/models/video_gallery.dart';
typedef StringCallback = void Function(String val);
class VideoCard extends StatelessWidget {
  final VideoGallery galleryItem;
  final StringCallback notifyParent;
  const VideoCard({ required this.galleryItem, required this.notifyParent, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return InkWell(
      onTap: () => notifyParent(galleryItem.networkUrl??''),
      child: Container(
        margin: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Flexible(
                flex: 1,
                child: Image.asset(galleryItem.icon??'assets/images/video.png',
                  height: 100,
                  width: 100,
                )
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      galleryItem.title??'',
                      maxLines: 2,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      galleryItem.description??'',
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
