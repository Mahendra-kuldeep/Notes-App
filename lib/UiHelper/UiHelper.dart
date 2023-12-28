import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiHelper{
  CustomTF(double border,String text,IconData iconData , TextEditingController Controller,String label){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 14),
      child: TextField(
        controller: Controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(border)),
            hintText: text,
            label: Text(label),
            prefixIcon: Icon(iconData)
        ),
      ),
    );
  }
}