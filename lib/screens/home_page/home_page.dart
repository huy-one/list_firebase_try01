
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:list_firebase_try01/blocs/login_bloc.dart';
import 'package:list_firebase_try01/screens/login_and_register/login_page.dart';
import 'package:list_firebase_try01/services/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth _auth =FirebaseAuth.instance;
  String titleAppBar='ad';
  List<Data> dataList = [];
  LoginBloc _loginBloc =LoginBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseReference reference =
    FirebaseDatabase.instance.reference().child('data');
    reference.once().then((DataSnapshot dataSnapshot) {
      dataList.clear();
      var keys = dataSnapshot.value.keys;
      var values = dataSnapshot.value;
      for (var key in keys) {
        Data data = new Data(
          values[key]['imgUrl'],
          values[key]['name'],
          values[key]['material'],
          values[key]['price'],
        );
        dataList.add(data);
      }
    });
    DatabaseReference _userReference =FirebaseDatabase.instance.reference().child('user');
    _userReference.child(_auth.currentUser!.uid).once().then((DataSnapshot snapshot) {
     setState(() {
       titleAppBar = snapshot.value['name'];
       print(titleAppBar);
     });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.3),
        title: Text('Hello '+titleAppBar.toUpperCase()),
        actions: [
          IconButton(onPressed: (){
            _loginBloc.SignOut((){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
            });
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: dataList.length==0 ? Center(child: Text('No data available')) :
      ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context,index){
        return CardUI(
          dataList[index].imgUrl,
          dataList[index].name,
          dataList[index].material,
          dataList[index].price,
        );
      })
    );
  }

  Widget CardUI(String imgUrl, String name, String material, String price) {
    return Card(
      margin: EdgeInsets.all(15),
      color: Colors.grey.withOpacity(0.3),
      child:  Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(imgUrl,fit: BoxFit.cover,height: 100,),
            Column(
              children: [
                Text(name,style: TextStyle(
                    color: Colors.grey,fontSize: 25,fontWeight: FontWeight.bold
                ),),
                SizedBox(),
                Text('material: $material',),
                Text(price),
              ],
            )
          ],
        ),
      ),
    );
  }
}
