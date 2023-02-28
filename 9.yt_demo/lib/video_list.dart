import 'package:flutter/material.dart';

import 'data.dart';
import 'thumbnail.dart';
import 'video_player.dart';

class VideoList extends StatelessWidget {
  const VideoList({
    super.key,
  });

  final _videoData = videoDatas;

  @override
  Widget build(BuildContext context) {
    void onThumbnailPress(String src) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => VideoPlayer(src: src)));
    }

    return ListView.builder(
        itemCount: _videoData.length,
        itemBuilder: (context, index) {
          final data = _videoData[index];
          return Card(
            elevation: 5,
            child: Thumbnail(
                data: data, onPress: () => onThumbnailPress(data.link)),
          );
        });
  }
}
