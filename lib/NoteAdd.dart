import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteappprovider/Models/NoteModel.dart';
import 'package:noteappprovider/NoteApp/NotesApp.dart';
import 'package:noteappprovider/Provider/NotesProvider.dart';
import 'package:noteappprovider/UiHelper/UiHelper.dart';
import 'package:provider/provider.dart';

class NoteAdd extends StatefulWidget {
  const NoteAdd({super.key});

  @override
  State<NoteAdd> createState() => _NoteAddState();
}
class _NoteAddState extends State<NoteAdd> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController= TextEditingController();
  addData(String utitle,String udesc){
    if(utitle=="" && udesc==""){
      return AlertDialog(
        title: Text("warnning",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
        content: Text("Please fill required filled"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Ok"))
        ],
      );
    }
    else{
      context.read<NotesProvider>().addnotes(NoteModel(title: utitle, desc: udesc));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue,
            Colors.white60
          ],begin: Alignment.topLeft,end: Alignment.bottomRight)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper().CustomTF(6, "Title", Icons.title, titleController, "Title"),
            UiHelper().CustomTF(6, "Description", Icons.description_outlined, descController, "Description"),
            SizedBox(height: 10,),
            Container(
                height: 42,
                width: 100,
                child: ElevatedButton(onPressed: (){
                   addData(titleController.text.toString(), descController.text.toString());
                  Navigator.pop(context);
                }, child:Text("Save",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)))
          ],
        ),
      ),
    );
  }
}
