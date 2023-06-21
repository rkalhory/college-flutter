import 'package:college/models/term.dart';
import 'package:college/providers/selected_lessons.dart';
import 'package:college/providers/terms_list.dart';
import 'package:college/views/lessons/lessons_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LessonsPage extends StatelessWidget {

  const LessonsPage({Key? key, required this.termsList, required this.selectedLessons,required this.term}) : super(key: key);

  final TermsList termsList;
  final SelectedLessons selectedLessons;
  final Term term;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: termsList),
        ChangeNotifierProvider.value(value: selectedLessons),
      ],
      child: LessonsView(term:term),
    );
  }
}
