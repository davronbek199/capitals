import 'package:flutter/material.dart';
import 'package:poytaxtlar/screens/widgets/word_item.dart';
import 'package:provider/provider.dart';

import '../../database_helper.dart';
import '../../main_provider.dart';
import '../../models/word.dart';

class WordList extends StatefulWidget {
  const WordList({Key? key}) : super(key: key);

  @override
  State<WordList> createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  @override
  void initState() {
    super.initState();
    DatabaseHelper.instance.loadDB(context);
  }

  @override
  Widget build(BuildContext context) {
    updateQuery();
    return SizedBox(
      height: MediaQuery.of(context).size.height * .9,
      child: Consumer<MainProvider>(builder: (context, data, child) {
        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 10),
          itemBuilder: (context, index) {
            return WordItem(data.words[index]);
          },
          itemCount: data.words.length,
        );
      }),
    );
  }

  void updateQuery({String? word}) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    mainProvider.initList(word: word);
  }
}
