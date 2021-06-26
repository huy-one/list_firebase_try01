import 'package:flutter/material.dart';

class LoginCustomTF extends StatelessWidget {
  final TextEditingController controller;
  final IconData iconData;
  final String title;
  final Stream stream;

  const LoginCustomTF({Key? key, required this.controller, required this.iconData, required this.title, required this.stream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          return TextField(
            controller: controller,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                hintText: 'enter email',
                errorText: snapshot.hasError?snapshot.error.toString(): null,
                labelText: title,
                labelStyle: TextStyle(
                  fontSize: 25,
                )
            ),
          );
        }
      ),
    );
  }
}
