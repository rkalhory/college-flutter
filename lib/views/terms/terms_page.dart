import 'package:college/core/lessons.dart';
import 'package:college/providers/selected_lessons.dart';
import 'package:college/providers/terms_list.dart';
import 'package:college/views/terms/terms_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TermsList>(
          create: (context) => TermsList(),
        ),
        ChangeNotifierProvider<SelectedLessons>(
          create: (context) => SelectedLessons(),
        ),

      ],
      child: TermsView(),
    );
  }
}
