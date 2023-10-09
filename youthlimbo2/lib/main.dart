import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youthlimbo2/data/provider/my_user_data.dart';
import 'package:youthlimbo2/firebase/firestore_provider.dart';
import 'package:youthlimbo2/main_page.dart';
import 'package:youthlimbo2/screens/auth_page.dart';
import 'package:youthlimbo2/widgets/my_progress_indicator.dart';

void main(){
  return runApp(ChangeNotifierProvider<MyUserData>(create:(context)=> MyUserData(),child: MyApp()));
}
bool isitfirstdata = true;


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: StreamBuilder<FirebaseUser>(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (context, snapshot) {
            if(isitfirstdata) {
              isitfirstdata = false;
              return MyProgressIndicator();
            } else {
              if (snapshot.hasData) {
                firestoreProvider.attemptCreateUser(userKey: snapshot.data.uid, email: snapshot.data.email);
                var myUserData = Provider.of<MyUserData>(context);
                firestoreProvider.connectMyUserData(snapshot.data.uid).listen((user){
                  myUserData.setuserData(user);
                });
                return MainPage();
              }
              return AuthPage();
            }
          }
      ),
    );
  }

}