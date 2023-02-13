import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([http.Client])
void main() {}

class GenshinCharacters {
  final List<String> genshinCharacters;

  const GenshinCharacters({required this.genshinCharacters});

  factory GenshinCharacters.fromJson(dynamic json) {
    return GenshinCharacters(genshinCharacters: List.from(json));
  }
}

Future<GenshinCharacters> fetchCharacters(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://api.genshin.dev/characters'));

  if (response.statusCode == 200) {
    return GenshinCharacters.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.reasonPhrase);
  }
}
