import 'package:flutter/cupertino.dart';
import 'package:noteappprovider/DbHelper/DbHelper.dart';

import '../Models/NoteModel.dart';

class NotesProvider extends ChangeNotifier{
  List<NoteModel>arrList = [];
  DbHelper myDb = DbHelper.instence;
  //add notes
  addnotes(NoteModel noteModel)async{
    var check =  await myDb.insertnote(noteModel);
    if(check){
      arrList = await myDb.getData();
      notifyListeners();
    }
  }

  //default notes data
  fatchinitialnotes()async{
    await myDb.getData();
    notifyListeners();
  }

  //get notes when add
  List<NoteModel>getnotes()
  {
    fatchinitialnotes();
    return arrList;
  }
updatenotes(NoteModel newNotes)async{
    await myDb.updatenote(newNotes);
    arrList = await myDb.getData();
    notifyListeners();
}
deletenotes(int Column_id)async{
    await myDb.deletenote(Column_id);
    arrList = await myDb.getData();
    notifyListeners();

}
}