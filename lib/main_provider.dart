import 'package:flutter/cupertino.dart';
import 'package:poytaxtlar/database_helper.dart';
import 'package:poytaxtlar/models/word.dart';

class MainProvider extends ChangeNotifier {
  final List<Word> words = [];
  bool showCity = false;

  initList({String? word, bool? isCity}) async {
    words.clear();
    if (word == null) {
      words.addAll(await DatabaseHelper.instance.getWords());
    } else {
      words.addAll(await DatabaseHelper.instance.getWordLike(word, isCity!));
    }
    notifyListeners();
  }

  change() {
    showCity = !showCity;
    notifyListeners();
  }
}
