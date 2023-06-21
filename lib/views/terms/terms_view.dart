import 'package:college/core/constant.dart';
import 'package:college/providers/selected_lessons.dart';
import 'package:college/providers/terms_list.dart';
import 'package:college/views/lessons/lessons_page.dart';
import 'package:college/views/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TermsView extends StatelessWidget {
  const TermsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.purple,
        title: const Text('University semesters'),),
      body: Consumer<TermsList>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(provider.list.length, (index) {
                return Padding(
                  padding: const EdgeInsetsDirectional.only(bottom:5,end:5,start:5,top:5),
                  child: MyCard(
                      index:index,
                      list:provider.list,
                      removeTerm:provider.removeTerm,
                      providerTerms:Provider.of<TermsList>(context, listen: false),
                      providerLesson:Provider.of<SelectedLessons>(context, listen: false)
                  ),
                );
              }),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButton: Consumer<TermsList>(
        builder: (context, provider, child) {
          return FloatingActionButton(
            onPressed: provider.list.length<10 ? () => provider.addNewTerm() : null,
            tooltip: 'Increment Counter',
            backgroundColor: provider.list.length<10 ?MyColors.purple:Colors.black26,
            child: const Icon(Icons.add),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
