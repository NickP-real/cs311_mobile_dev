import 'package:flutter/material.dart';

import 'data.dart';

class Thumbnail extends StatelessWidget {
  const Thumbnail({
    required this.data,
    required this.onPress,
    super.key,
  });

  final VideoData data;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              child: Image.network(
                data.thumbnail,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                    padding: const EdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(data.duration,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.white)))),
          ],
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(data.pic),
          ),
          title: Text(data.name),
          subtitle: Text(data.author),
        )
      ]),
    );
  }
}
