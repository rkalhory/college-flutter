
class Term {

  int id;
  List<int> lessons;
  int some;

  Term({required this.id,required this.lessons,required this.some});

  factory Term.fromJson(Map<String,dynamic> val){
    return Term(
      id:val['id'],
      lessons:val['lessons'],
      some:val['some'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['lessons'] = lessons;
    map['some'] = some;
    return map;
  }

}




/// title : ""
/// no : false

// class Todo {
//   Todo({
//     String? title,
//     bool? no,}){
//     _title = title;
//     _no = no;
//   }
//
//   Todo.fromJson(dynamic json) {
//     _title = json['title'];
//     _no = json['no'];
//   }
//   String? _title;
//   bool? _no;
//   Todo copyWith({  String? title,
//     bool? no,
//   }) => Todo(  title: title ?? _title,
//     no: no ?? _no,
//   );
//   String? get title => _title;
//   bool? get no => _no;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['title'] = _title;
//     map['no'] = _no;
//     return map;
//   }
//
// }




