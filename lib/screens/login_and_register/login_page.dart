
import 'package:flutter/material.dart';
import 'package:list_firebase_try01/blocs/login_bloc.dart';
import 'package:list_firebase_try01/screens/dialogs/error_dialog.dart';
import 'package:list_firebase_try01/screens/dialogs/loading_dialog.dart';
import 'package:list_firebase_try01/screens/home_page/home_page.dart';
import 'package:list_firebase_try01/screens/login_and_register/components/login_button.dart';
import 'package:list_firebase_try01/screens/login_and_register/register_page.dart';
import 'components/design_icon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordHide =true;
  TextEditingController _emailController =new TextEditingController();
  TextEditingController _passController =new TextEditingController();

  LoginBloc _loginBloc =LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
            designIcon('Welcome Back'),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: StreamBuilder(
                stream: _loginBloc.emailStream,
                builder: (context, snapshot) {
                  return TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.stream),
                        hintText: 'enter in here',
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontSize: 25,
                        )
                    ),
                  );
                }
              ),
            ),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: StreamBuilder(
                    stream: _loginBloc.passStream,
                    builder: (context, snapshot) {
                      return TextField(
                        obscureText: _passwordHide,
                        controller: _passController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            hintText: 'enter enter in here',
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontSize: 25,
                            )
                        ),
                      );
                    }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        _passwordHide=!_passwordHide;
                      });
                    },
                    child: Text(_passwordHide? 'show':'hide',style: TextStyle(
                        color: Colors.grey
                    ),),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap:(){
                    setState(() {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterPage()));
                    });
                  },
                  child: Text('Create new account? register'),
                ),
              ),
            ),
            LoginButton(title: 'Sign In', callback: (){
              onSignInClick();
            }),
          ],
        ),
      )
    );
  }

  void onSignInClick(){
    var email =_emailController.text;
    var password =_passController.text;
      LoadingDialog.showLoadingDialog(context, 'Loading');
    _loginBloc.SignIn(email, password, (){
      LoadingDialog.hideLoadingDialog(context);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
    }, (error) {
      LoadingDialog.hideLoadingDialog(context);
      ErrorDialog.showErrorDialog(context, 'ERROR', error);
    });
  }

}
