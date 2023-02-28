class VideoData {
  final String author;
  final String pic;
  final String link;
  final String name;
  final String duration;
  final String thumbnail;

  const VideoData({
    required this.author,
    required this.pic,
    required this.link,
    required this.name,
    required this.duration,
  }) : thumbnail = 'https://img.youtube.com/vi/$link/0.jpg';
}

const List<VideoData> videoDatas = [
  VideoData(
    author: 'Evaze',
    pic:
        'https://yt3.googleusercontent.com/OpGVuwXg6oK24MIJzVxMeXLdCeZNOOahLA6alWSs4Sz7YTn3783TSOVXBsu4Uh7vcVGO4qhH=s88-c-k-c0x00ffffff-no-rj',
    link: 'NHaq0EbeHHQ',
    name: 'The Entire Story Of Destiny! (Creation To Lightfall)',
    duration: '4:23:17',
  ),
  VideoData(
    author: 'pamalaz',
    pic:
        'https://yt3.googleusercontent.com/ytc/AL5GRJXlVPLCWIc0UllWnAocYpUC4APgPlH0k224XXRgxg=s88-c-k-c0x00ffffff-no-rj',
    link: 'y2ni8Emo9z0',
    name: 'The Entire Story Of Destiny! (Creation To Lightfall)',
    duration: '3:35',
  ),
  VideoData(
    author: 'Itsnickford',
    pic:
        'https://yt3.googleusercontent.com/ytc/AL5GRJWbceLTzUgcxlXRuTAegh5KXkcSQoXAsFDOBuezBw=s88-c-k-c0x00ffffff-no-rj',
    link: 'gDjMZvYWUdo',
    name: 'Saul goodman 3d',
    duration: '0:15',
  ),
  VideoData(
    author: 'Hanoi Cursed Department',
    pic:
        'https://yt3.googleusercontent.com/-fZw-3dSMTWkTnJNT0vtxSnxlBoVCcveYYwsRYI2nFWuiUgIGw1RkmN4M8_jE09v_z1MUCaV3g=s88-c-k-c0x00ffffff-no-rj',
    link: 'G2uC_7BYKAo',
    name: 'Saul Goodman in Vietnam',
    duration: '0:30',
  ),
  VideoData(
    author: 'Corridor Crew',
    pic:
        'https://yt3.googleusercontent.com/okRlBwXJN68DuPhHs_AaMlOHVwfnHWEL7is5lV3RTyYlJSDvOy58-q-OyCm5bSOU71csOHyaKQ=s88-c-k-c0x00ffffff-no-rj',
    link: '_9LX9HSQkWo',
    name: 'Did We Just Change Animation Forever?',
    duration: '23:01',
  ),
  VideoData(
    author: 'UnusualVideos',
    pic:
        'https://yt3.googleusercontent.com/ytc/AL5GRJXFON5ABJ7SVrN9l9l0T7reZgnaV5AZKqCbSjxmqw=s88-c-k-c0x00ffffff-no-rj',
    link: 'NIJ5RiMAmNs',
    name: 'UNUSUAL MEMES COMPILATION V103',
    duration: '7:30',
  ),
];
