import 'package:cs311hw10/1_domain/entities/genshin_character_entity.dart';
import 'package:cs311hw10/character_number.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GenshinWebView extends StatelessWidget {
  const GenshinWebView({super.key, required this.character});

  final GenshinCharacterEntity character;

  @override
  Widget build(BuildContext context) {
    final url = 'https://genshin.hoyoverse.com/en/character/'
        '${character.nation.toLowerCase()}?char=${charId[character.id]}';
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(),
      )
      ..loadRequest(Uri.parse(url));

    return Scaffold(
        appBar: AppBar(
            title: Text(character.name),
            leading: IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () => Navigator.pop(context)),
            centerTitle: true),
        body: WebViewWidget(controller: controller));
  }
}
