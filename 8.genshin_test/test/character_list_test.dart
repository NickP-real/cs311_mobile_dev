import 'package:cs311hw08/character_detail.dart';
import 'package:cs311hw08/character_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'character_list_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets('CharacterList shold return ListView', (tester) async {
    final client = MockClient();

    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => http.Response(
            '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]', 200));

    await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: CharacterList(client: client))));
    await tester.pumpAndSettle();

    final findListView = find.byType(ListView);

    expect(findListView, findsOneWidget);
  });

  testWidgets('show error text when there is error, no ListView',
      (tester) async {
    final client = MockClient();

    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => http.Response('Not Found', 404));

    await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: CharacterList(client: client))));
    await tester.pumpAndSettle();

    final findListView = find.byType(ListView);
    final findText = find.byType(Text);

    expect(findListView, findsNothing);
    expect(findText, findsOneWidget);
  });

  testWidgets('should have at least ListTile', (tester) async {
    final client = MockClient();

    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => http.Response(
            '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]', 200));

    await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: CharacterList(client: client))));
    await tester.pumpAndSettle();

    final findListView = find.byType(ListTile);

    expect(findListView, findsWidgets);
  });

  testWidgets('tab a ListTile should navigate to CharacterDetail',
      (tester) async {
    final client = MockClient();

    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => http.Response(
            '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]', 200));

    await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: CharacterList(client: client))));
    await tester.pumpAndSettle();

    await tester.tapAt(tester.getCenter(find.byType(ListTile).first));
    await tester.pumpAndSettle();

    final findCharacterDetail = find.byType(CharacterDetail);

    expect(findCharacterDetail, findsOneWidget);
  });
}
