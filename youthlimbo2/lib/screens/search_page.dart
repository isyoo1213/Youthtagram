import 'package:flutter/material.dart';
import 'package:youthlimbo2/utils/profile_image_path.dart';
import 'file:///E:/flutter_workspace/youthlimbo2/lib/constants/size.dart';

class SearchPage extends StatelessWidget {
  final List<String> users = List.generate(10, (i) => 'user $i');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            return _item(users[index]);
          },
          separatorBuilder: (context, index){
            return Divider(thickness: 1, color: Colors.grey[200],);
          },
        ));
  }

  ListTile _item(String user) {
    return ListTile(
      leading: CircleAvatar(
        radius: profileradius,
        backgroundImage: NetworkImage(getProfileImagePath(user)),
      ),
      title: Text(user),
      subtitle: Text('this is $user bio.'),
      trailing: Container(
        height: 30,
        width: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red[50],
          border: Border.all(color: Colors.black54, width: 0.5),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          'Following',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[700]),
        ),
      ),
    );
  }
}
