import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:youthlimbo2/data/user.dart';

class Transformer{
  final toUser = StreamTransformer<DocumentSnapshot, User>.fromHandlers(
    handleData: (snapshot, sink) async{
      sink.add(User.formSnapshot(snapshot));
    }
  );

  final toUsers = StreamTransformer<QuerySnapshot, List<User>>.fromHandlers(
      handleData: (snapshot, sink) async {
        List<User> users = [];
        snapshot.documents.forEach((doc){
            users.add(User.formSnapshot(doc));
        });
        sink.add(users);
      }
  );

  final toUsersExceptMine = StreamTransformer<QuerySnapshot, List<User>>.fromHandlers(
    handleData: (snapshot, sink) async {
      List<User> users = [];
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      snapshot.documents.forEach((doc){
        if(doc.documentID != user.uid)
          users.add(User.formSnapshot(doc));
      });
      sink.add(users);
    }
  );
}