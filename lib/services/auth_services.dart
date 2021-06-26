import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var _database =FirebaseDatabase.instance.reference().child('user');

  void RegisterWithEmailAndPass(String name, String email, String phone,
      String password, Function onSuccess, Function(String) onError) {
    _auth.createUserWithEmailAndPassword(email: email, password: password)
        .then((user) =>_createUser(_auth.currentUser!.uid, name, phone, onSuccess, onError))
        .catchError((error) {
       onError('Error: '+error.code);
    });
  }

  void SignInWithEmailAndPass(String email, String password, Function onSuccess,
      Function(String) onError) {
    _auth.signInWithEmailAndPassword(email: email, password: password).then((
        user) => onSuccess()).catchError((error){
          onError('Error: '+error.code);
    });
  }

  void signOut() async{
    return _auth.signOut();
  }

  void _createUser(String userId,String name,String phone,Function onSuccess,Function(String) onError){
    var user ={'name' : name,'phone' : phone};
    _database.child(userId).set(user).then((user) => onSuccess).catchError((error)=>
      onError('Create User fail')
    );
  }


}