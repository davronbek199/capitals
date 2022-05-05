import 'package:flutter/cupertino.dart';
import 'package:poytaxtlar/database_helper.dart';
import 'package:poytaxtlar/models/word.dart';

class MainProvider extends ChangeNotifier {
  final List<Word> words = [];

  initList({String? word}) async {
    words.clear();
    if (word == null) {
      words.addAll(await DatabaseHelper.instance.getWords());
    } else {
      words.addAll(await DatabaseHelper.instance.getWordLike(word));
    }
    notifyListeners();
  }
}
