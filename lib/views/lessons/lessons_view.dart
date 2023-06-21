import 'package:college/core/constant.dart';
import 'package:college/core/lessons.dart';
import 'package:college/models/term.dart';
import 'package:college/providers/selected_lessons.dart';
import 'package:college/providers/terms_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LessonsView extends StatelessWidget {
  LessonsView({Key? key,required this.term}) : super(key: key);

  final Term term;

  int some=0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height:730,
      child: Consumer2<SelectedLessons,TermsList>(
        builder: (context, providerSelected,providerTerms, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    padding: const EdgeInsetsDirectional.only(bottom:2,end:7,start:7,top:2),
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                      color: MyColors.purple,
                    ),
                    child: Center(child: Text('Select Lessons',style: TextStyle(color: Colors.white,fontSize: 18),),),
                ),
                DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text('Title'),
                      ),
                      DataColumn(
                        label: Text('Unit'),
                      ),

                    ],
                    rows: List<DataRow>.generate(
                      Lessons.items.length,
                          (int index) => DataRow(
                        color: MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context).colorScheme.primary.withOpacity(0.08);
                              }
                              if (index.isEven) {
                                return Colors.grey.withOpacity(0.3);
                              }
                              return null;
                            }),
                        cells: <DataCell>[
                          DataCell(Text(Lessons.items[index].name)),
                          DataCell(Text('${Lessons.items[index].unit}')),
                        ],
                        selected: providerSelected.selected[index],
                        onSelectChanged: (bool? value) {
                          providerSelected.update(index, value!);
                          int someTemp=0;
                          providerSelected.selected.asMap().forEach((index, value){
                            if (value){
                              someTemp += Lessons.items[index].unit;
                            }
                          });
                          some=someTemp;
                        },
                      ),
                    ),
                  ),
                SizedBox(
                  width: double.infinity,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(bottom:0,end:10,start:10,top:25),
                      child: Text('You select ${some==0?'${term.some}':'$some'} unit.',style: TextStyle(fontSize: 16),),
                    )),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom:0,end:10,start:10,top:30),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FilledButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(MyColors.purple),
                          ),
                          onPressed: () {
                            List<int> temp=[];
                            providerSelected.selected.asMap().forEach((index, value){
                              if (value){
                                temp.add(Lessons.items[index].id);
                              }
                            });
                            if(some>=14 && some<=20){
                              providerTerms.EditTerm(term.id,temp,some);
                              Navigator.pop(context);
                            }else{
                              showDialog<String>(
                                useRootNavigator:false,
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  // title: const Text('AlertDialog Title'),
                                  content: const Text('The number of units should be between 14 and 20'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }

                          },
                          child: Text('Add'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}