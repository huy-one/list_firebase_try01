import 'dart:async';

import 'package:list_firebase_try01/services/auth_services.dart';

class LoginBloc{
  StreamController _nameController =new StreamController();
  StreamController _emailController =new StreamController();
  StreamController _passController =new StreamController();
  StreamController _phoneController =new StreamController();

  Stream get nameStream =>_nameController.stream;
  Stream get emailStream =>_emailController.stream;
  Stream get phoneStream =>_phoneController.stream;
  Stream get passStream =>_passController.stream;

  AuthService _authService =AuthService();

  bool isValid(String name,String email,String phone,String password){
    if(name.isEmpty){
      _nameController.sink.addError('please enter again');
      return false;
    }
    _nameController.sink.add('');

    if(email.isEmpty||!email.contains('@')){
      _emailController.sink.addError('please enter again');
      return false;
    }
    _emailController.sink.add('');

    if(phone.isEmpty){
      _phoneController.sink.addError('please enter again');
      return false;
    }
    _phoneController.sink.add('');

    if(password.isEmpty){
      _passController.sink.addError('please enter again');
      return false;
    }
    _passController.sink.add('');
    return true;
  }

  void Register(String name,String email,String phone,String password,Function onSuccess,Function(String) onError){
    _authService.RegisterWithEmailAndPass(name, email, phone, password, onSuccess, onError);
  }

  void SignIn(String email,String password,Function onSuccess,Function(String) onError){
    _authService.SignInWithEmailAndPass(email, password, onSuccess, onError);
  }

  void SignOut(Function onSuccess){
    _authService.signOut();
  }
  void dispose(){
    _nameController.close();
    _phoneController.close();
    _emailController.close();
    _passController.close();
  }
}
