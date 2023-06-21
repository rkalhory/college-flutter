import 'package:college/core/constant.dart';
import 'package:college/core/lessons.dart';
import 'package:college/providers/terms_list.dart';
import 'package:college/views/lessons/lessons_page.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    required this.index,
    required this.list,
    required this.removeTerm,
    required this.providerTerms,
    required this.providerLesson,
  });
  
  final int index;
  final List list;
  final providerTerms;
  final providerLesson;

  final Function removeTerm;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 70,
        child: Column(
          children: [
            Container(
                padding: const EdgeInsetsDirectional.only(bottom:2,end:7,start:7,top:2),
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: MyColors.purpleLight,

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text('Term ${index+1}',style: TextStyle(color: Colors.white,fontSize: 14),),),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if(list[index].lessons.length!=0)IconButton(
                            onPressed: () {
                              List<bool> temp=List<bool>.generate(Lessons.items.length, (int index) => false);;
                              list[index].lessons.forEach((e)=>temp[e]=true);
                              providerLesson.updateAll(temp);
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0)),
                                      child: LessonsPage(
                                          termsList: providerTerms,selectedLessons:providerLesson, term: list[index]),
                                    );
                                  });
                            },
                            padding: EdgeInsets.zero,
                            iconSize: 18,
                            splashRadius: 10,
                            icon: Icon(Icons.edit,color: Colors.blue,)
                        ),
                        if(list.length>1)IconButton(
                            onPressed:()=>removeTerm(list[index].id),
                            padding: EdgeInsets.zero,
                            iconSize: 18,
                            splashRadius: 40,
                            icon: Icon(Icons.remove_circle,color: Colors.red)
                        ),
                      ],
                    )

                  ],
                )
            ),
            if(list[index].lessons.length!=0)Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${list[index].lessons.length} Lessons',style: TextStyle(fontSize: 16),),
                Text('${list[index].some} Unit',style: TextStyle(fontSize: 16),),
              ],
            ))else Expanded(
              child:
              Center(
                child: OutlinedButton.icon(
                  onPressed: () {
                    List<bool> temp=List<bool>.generate(Lessons.items.length, (int index) => false);;
                    list[index].lessons.forEach((e)=>temp[e]=true);
                    providerLesson.updateAll(temp);
                      showDialog(
                          context: context,
                          builder: (_) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: LessonsPage(
                                  termsList: providerTerms,selectedLessons:providerLesson, term: list[index]),
                            );
                          });
                    },
                  icon: const Icon(Icons.add),
                  label: const Text('Add'),
                ),
              ),

            )
          ],
        ),
      ),
    );
  }
}

