// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Numbers',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Random Numbers'),
        ),
        body: const Center(
          child: RandomNumbers(),
        ),
      ),
    );
  }
}

class RandomNumbers extends StatefulWidget {
  const RandomNumbers({super.key});

  @override
  State<RandomNumbers> createState() => _RandomNumbersState();
}

class _RandomNumbersState extends State<RandomNumbers> {
  final items = List<ListItem>.generate(100, (i) => HeadingItem(i + 1));
  Iterable<ListItem> tmpItems = [];
  String mode = "None";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Showing: $mode",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => showEven(),
                child: const Text("Show Even"),
              ),
              ElevatedButton(
                  onPressed: () => showID(), child: const Text("Show ID"))
            ],
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: tmpItems.length,
              itemBuilder: (context, i) {
                final item = tmpItems.elementAt(i);
                return ListTile(
                  title: item.buildTitle(context),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /*
  Convert items to tmpItems but only keep even numbers
   */
  void showEven() {
    setState(() {
      mode = "Even";
      tmpItems = items.where((element) => element.number.isEven);
    });
  }

  /*
  Convert items to tmpItems but only keep number that is in your student ID
  If your student ID is 630510000, then 3, 6, 10, 30, 51 and 100 are kept.
   */
  void showID() {
    String id = "630510590";
    setState(() {
      mode = "ID";
      tmpItems =
          items.where((element) => id.contains(element.number.toString()));
    });
  }
}

abstract class ListItem {
  late final int number;
  Widget buildTitle(BuildContext context);
}

class HeadingItem implements ListItem {
  HeadingItem(this.number);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      number.toString(),
      style: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  int number;
}
