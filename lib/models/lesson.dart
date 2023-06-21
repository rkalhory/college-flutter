
class Lesson {

  int id;
  String name;
  int unit;

  Lesson({required this.id,required this.name,required this.unit});

  factory Lesson.fromJson(Map<String,dynamic> val){
    return Lesson(
      id:val['id'],
      name:val['name'],
      unit:val['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['unit'] = unit;
    return map;
  }

}






