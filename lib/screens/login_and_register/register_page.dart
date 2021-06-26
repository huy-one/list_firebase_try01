import 'package:flutter/material.dart';
import 'package:list_firebase_try01/blocs/login_bloc.dart';
import 'package:list_firebase_try01/screens/dialogs/error_dialog.dart';
import 'package:list_firebase_try01/screens/dialogs/loading_dialog.dart';
import 'package:list_firebase_try01/screens/home_page/home_page.dart';
import 'package:list_firebase_try01/screens/login_and_register/components/login_custom_textfield.dart';
import 'package:list_firebase_try01/screens/login_and_register/login_page.dart';

import 'components/design_icon.dart';
import 'components/login_button.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController =new TextEditingController();
  TextEditingController _passController =new TextEditingController();
  TextEditingController _nameController =new TextEditingController();
  TextEditingController _phoneController =new TextEditingController();

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
            LoginCustomTF(controller: _nameController, iconData: Icons.stream, title: 'Name', stream: _loginBloc.nameStream,),
            LoginCustomTF(controller: _emailController, iconData: Icons.email_outlined, title: 'Email', stream: _loginBloc.emailStream,),
            LoginCustomTF(controller: _phoneController, iconData: Icons.phone_android_outlined, title: 'Phone', stream: _loginBloc.phoneStream,),
            LoginCustomTF(controller: _passController, iconData: Icons.lock_outline, title: 'Password', stream: _loginBloc.passStream,),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap:(){
                    setState(() {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                    });
                  },
                  child: Text('Have a account? sign in'),
                ),
              ),
            ),
            LoginButton(title: 'Sign Up', callback: (){
              onRegisterClick();
            }),
          ],
        ),
      ),
    );
  }
  void onRegisterClick(){
    var name =_nameController.text;
    var email =_emailController.text;
    var phone =_phoneController.text;
    var password =_passController.text;
    if(_loginBloc.isValid(name, email, phone, password)){
      LoadingDialog.showLoadingDialog(context, 'Loading');
      _loginBloc.Register(name, email, phone, password, (){
        LoadingDialog.hideLoadingDialog(context);
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
      }, (error){
        LoadingDialog.hideLoadingDialog(context);
        ErrorDialog.showErrorDialog(context, 'ERROR', error);
      });
    }
  }
}
