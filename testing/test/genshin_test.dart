import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:testing/genshin_characters.dart';
import 'package:http/http.dart' as http;
import 'package:testing/genshin_characters.mocks.dart';

void main() {
  test('returns GenshinCharacters if the http call completes successfully',
      () async {
    final client = MockClient();
    // Use Mockito to return a successful response when it calls the
    // provided http.Client.
    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => http.Response(
            '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]', 200));
    expect(await fetchCharacters(client), isA<GenshinCharacters>());
  });

  test('throws an exception if the http call completes with an error', () {
    final client = MockClient();
    // Use Mockito to return an unsuccessful response when it calls the
    // provided http.Client.
    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => http.Response('Not Found', 404));
    expect(fetchCharacters(client), throwsException);
  });
}
