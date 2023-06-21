import 'package:college/models/term.dart';
import 'package:flutter/widgets.dart';

class TermsList extends ChangeNotifier {

  List<Term> list=[];

  void addNewTerm(){
    List<int> empty=[];
    Term temp=Term.fromJson({
      "id": UniqueKey().hashCode,
      "lessons": empty,
      "some":0
    });
    list.add(temp);
    notifyListeners();
  }

  void removeTerm(int id){
    int index = list.indexWhere((item) => item.id == id);
    list.removeAt(index);
    notifyListeners();
  }

  void EditTerm(int id,List<int> lessonList,int some){
    int index = list.indexWhere((item) => item.id == id);
    list[index].lessons=lessonList;
    list[index].some=some;
    notifyListeners();
  }

}
