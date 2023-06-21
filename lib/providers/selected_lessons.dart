import 'package:college/core/lessons.dart';
import 'package:flutter/widgets.dart';

class SelectedLessons extends ChangeNotifier {

  List<bool> selected = List<bool>.generate(Lessons.items.length, (int index) => false);

  void update(int index,bool val){
    selected[index]=val;
    notifyListeners();
  }

  void updateAll(List<bool> val){
    selected=val;
    notifyListeners();
  }

}
