import 'package:noteappprovider/DbHelper/DbHelper.dart';

class NoteModel{
  int? id;
  String title;
  String desc;

  NoteModel({required this.title,required this.desc,this.id});

  factory NoteModel.fromMap(Map<String,dynamic>map){
    return NoteModel(title: map[DbHelper.column_title], desc: map[DbHelper.column_desc],id: map[DbHelper.column_id]);
  }

  Map<String,dynamic>toMap(){
    return {
      DbHelper.column_id:id,
      DbHelper.column_title:title,
      DbHelper.column_desc:desc
    };
  }
}