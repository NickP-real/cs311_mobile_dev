import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:testing/characters_list.dart';
import './characterlist_test.mocks.dart' as mock;

import 'package:http/http.dart' as http;

@GenerateMocks([http.Client])
void main() {
  testWidgets('CharacterList shold return a list of characters',
      (widgetTester) async {
    final client = mock.MockClient();

    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => http.Response(
            '["albedo", "aloy", "amber", "arataki-itto", "ayaka", "ayato"]',
            200));
    await widgetTester
        .pumpWidget(MaterialApp(home: CharacterList(client: client)));
    await widgetTester.pumpAndSettle();

    final findList = find.byType(ListTile);

    expect(findList, findsWidgets);
  });
}
