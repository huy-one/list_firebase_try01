import 'package:flutter/material.dart';

class LoadingDialog{
  static void showLoadingDialog(BuildContext context,String title){
    showDialog(context: context,
        barrierDismissible: false,
        builder: (context)=>new Dialog(
      child: Container(
        height: 100,width: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LinearProgressIndicator(),
            Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title,style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(width: 20,),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  static void hideLoadingDialog(BuildContext context){
    Navigator.of(context).pop(LoadingDialog());
  }
}