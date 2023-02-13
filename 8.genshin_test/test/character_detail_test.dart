import 'package:cs311hw08/character_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'character_detail_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets('CharacterDetail should have 6 text widgets', (tester) async {
    final client = MockClient();

    when(client.get(Uri.parse('https://api.genshin.dev/characters/albedo')))
        .thenAnswer((_) async => http.Response(
            '{"name": "Albedo", "vision": "Geo", "weapon": "Sword","nation":"Mondstadt", "description":"A genius known as the Kreideprinz, he is the Chief Alchemist and Captain of the Investigation Team of the Knights of Favonius."}',
            200));

    await tester.pumpWidget(
        MaterialApp(home: CharacterDetail(name: "albedo", client: client)));
    await tester.pumpAndSettle();

    final findText = find.byType(Text);

    expect(findText, findsNWidgets(6));
  });

  testWidgets('should have a text widget which have name content in a Column',
      (tester) async {
    final client = MockClient();

    when(client.get(Uri.parse('https://api.genshin.dev/characters/albedo')))
        .thenAnswer((_) async => http.Response(
            '{"name": "Albedo", "vision": "Geo", "weapon": "Sword","nation":"Mondstadt", "description":"A genius known as the Kreideprinz, he is the Chief Alchemist and Captain of the Investigation Team of the Knights of Favonius."}',
            200));

    await tester.pumpWidget(
        MaterialApp(home: CharacterDetail(name: "albedo", client: client)));
    await tester.pumpAndSettle();

    final findTextInColumn = find.widgetWithText(Column, 'Name: Albedo');

    expect(findTextInColumn, findsOneWidget);
  });

  testWidgets('should have an error text widget when there is error occur',
      (tester) async {
    final client = MockClient();

    when(client.get(Uri.parse('https://api.genshin.dev/characters/albedo')))
        .thenAnswer((_) async => http.Response('Not Found', 404));

    await tester.pumpWidget(
        MaterialApp(home: CharacterDetail(name: "albedo", client: client)));
    await tester.pumpAndSettle();

    final findText = find.byType(Text);

    expect(findText, findsNWidgets(2));
  });
}
