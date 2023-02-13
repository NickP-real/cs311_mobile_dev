import 'package:cs311hw08/genshin_characters.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'genshin_characters_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetch characters', () {
    test('return GenshinCharacters if the http call completes succesfully',
        () async {
      final client = MockClient();

      when(client.get(Uri.parse('https://api.genshin.dev/characters')))
          .thenAnswer((_) async => http.Response(
              '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]', 200));

      expect(await fetchCharacters(client), isA<GenshinCharacters>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      when(client.get(Uri.parse('https://api.genshin.dev/characters')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchCharacters(client), throwsException);
    });
  });

  group('fetch characters info', () {
    test('return CharacterInfo if the http call completes successfully',
        () async {
      final client = MockClient();

      // curl to get the info
      when(client.get(Uri.parse('https://api.genshin.dev/characters/albedo')))
          .thenAnswer((_) async => http.Response(
              '{"name": "Albedo", "vision": "Geo", "weapon": "Sword","nation":"Mondstadt", "description":"A genius known as the Kreideprinz, he is the Chief Alchemist and Captain of the Investigation Team of the Knights of Favonius."}',
              200));

      expect(await fetchCharacterInfo(client, "albedo"), isA<CharacterInfo>());
    });

    test('thows an exception if the http call completes with an error', () {
      final client = MockClient();

      when(client.get(Uri.parse('https://api.genshin.dev/characters/albedo')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchCharacterInfo(client, "albedo"), throwsException);
    });
  });
}
