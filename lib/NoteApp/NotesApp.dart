import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:noteappprovider/DbHelper/DbHelper.dart';
import 'package:noteappprovider/Models/NoteModel.dart';
import 'package:noteappprovider/Provider/NotesProvider.dart';
import 'package:provider/provider.dart';

import '../NoteAdd.dart';
import '../UiHelper/UiHelper.dart';

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  List<NoteModel>arrNotes=[];
  late DbHelper myDb;
  @override
  void initState() {
    super.initState();
    getnotes();
  }
  getallnotes()async{
    arrNotes = await myDb.getData();
  }
 getnotes(){
   context.read<NotesProvider>().fatchinitialnotes();
 }
 updatenotes(NoteModel notes){
    context.read<NotesProvider>().updatenotes(notes);
 }
 // deletenotes(NoteModel column_id){
 //    context.read<NotesProvider>().deletenotes(NoteModel(id: column_id));
 // }
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_,provider,__){
        return Scaffold(
          appBar: AppBar(
            title: Text("𝐍𝐨𝐭𝐞𝐬𝐀𝐏𝐏",style: TextStyle(fontSize: 20),),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          floatingActionButton: FloatingActionButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteAdd()));

          },child: Icon(Icons.note_add_outlined),),
          body: ListView.builder(itemBuilder: (BuildContext _, index){
            return Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.primaries[Random().nextInt(Colors.primaries.length)]
                ),
                child: ListTile(
                  leading: CircleAvatar(
                   // child: Text("${provider.}"),
                  ),
                  //title: Text("${provider.}"),
                  //subtitle: Text("${provider.arrList[index].desc}"),
                  trailing: Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.edit_location_outlined)),
                      SizedBox(width: 13,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever_outlined))
                    ],
                  ),
                )
            );

          },),
        );
      },
    );
  }
}