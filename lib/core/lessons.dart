import 'package:college/models/lesson.dart';

class Lessons{
  static List<Lesson> items=[
    {'id':0, 'name':'Literature', 'unit':1},
    {'id':1, 'name':'Algorithm writing', 'unit':2},
    {'id':2, 'name':'Math', 'unit':3},
    {'id':3, 'name':'Operating systems', 'unit':3},
    {'id':4, 'name':'Data structure', 'unit':3},
    {'id':5, 'name':'Computer basics', 'unit':2},
    {'id':6, 'name':'Databases', 'unit':1},
    {'id':7, 'name':'Computer architecture', 'unit':2},
    {'id':8, 'name':'Logical circuits', 'unit':3},
    {'id':9, 'name':'Thesis', 'unit':6},
  ].map<Lesson>((e)=>Lesson.fromJson(e)).toList();
}