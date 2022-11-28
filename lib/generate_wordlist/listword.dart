import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class WordList extends StatefulWidget {
  const WordList({Key? key}) : super(key: key);

  @override
  State<WordList> createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  final wordPair = WordPair.random();
  final _suggestions = <WordPair>[]; // NEW
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Word Generator",
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return ListTile(
            title: Text(
              _suggestions[index].asPascalCase,
              style: _biggerFont,
            ),
          );
        },
      ),
    );
  }
}
