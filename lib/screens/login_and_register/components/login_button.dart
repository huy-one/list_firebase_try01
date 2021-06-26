import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;

  const LoginButton({Key? key, required this.title, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        height: 50,
        child: FlatButton(
          onPressed: callback,
          child: Text(title,style: TextStyle(
              color: Colors.white
          ),),
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
    );
  }
}
