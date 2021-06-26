import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorDialog{

  static void showErrorDialog(BuildContext context,String title,String msg){
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: [
        FlatButton(onPressed: (){
          Navigator.of(context).pop(ErrorDialog);
        }, child: Text('OK'))
      ],
    ));
  }
}