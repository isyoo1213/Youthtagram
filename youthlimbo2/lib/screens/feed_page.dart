import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youthlimbo2/firebase/firestore_provider.dart';
import 'package:youthlimbo2/utils/profile_image_path.dart';
import 'file:///E:/flutter_workspace/youthlimbo2/lib/constants/size.dart';
import 'package:youthlimbo2/widgets/comment.dart';
import 'package:youthlimbo2/widgets/my_progress_indicator.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: null,
            icon: ImageIcon(
              AssetImage('assets/youth_appbar.png'),
            )),
        title: Text(
          'Youthtagram',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
              onPressed: (){
                firestoreProvider.sendData().then((_) {
                  print('data sent to firestore');
                });
              },
              icon: ImageIcon(
                AssetImage('assets/actionbar_camera.png'),
                color: Colors.white,
              )),
          IconButton(
              onPressed: (){
                firestoreProvider.getData();
              },
              icon: ImageIcon(AssetImage('assets/direct_message.png'),
                  color: Colors.white)),
        ],
      ),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return _postitem(index, context);
          }),
    );
  }

  Column _postitem(int index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _post_header('username $index'),
        _post_image(index),
        _post_actions(),
        _post_likes(),
        _post_caption(context, index),
        _all_comment(),
      ],
    );
  }

  FlatButton _all_comment() {
    return FlatButton(
        onPressed: null,
        child: Padding(
          padding: const EdgeInsets.all(common_gap_xs),
          child: Text('Show all 17 comments', style: TextStyle(color: Colors.grey[600]),),
        ));
  }

  Padding _post_caption(BuildContext context, int index) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: common_gap),
        child: Comment(
            dateTime: DateTime.now(),
            showprofile: true,
            username: 'username $index',
            caption:
            "I'v lost my cat : ( "));
  }

  Padding _post_likes() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap_l, bottom: common_gap_xs),
      child: Text(
        '80 likes',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Row _post_actions() {
    return Row(
      children: <Widget>[
        IconButton(
            icon: ImageIcon(
              AssetImage('assets/bookmark.png'),
              color: Colors.black87,
            ),
            onPressed: null),
        IconButton(
            icon: ImageIcon(
              AssetImage('assets/comment.png'),
              color: Colors.black87,
            ),
            onPressed: null),
        IconButton(
            icon: ImageIcon(
              AssetImage('assets/direct_message.png'),
              color: Colors.black87,
            ),
            onPressed: null),
        Spacer(),
        IconButton(
            icon: ImageIcon(
              AssetImage('assets/heart_selected.png'),
              color: Colors.redAccent,
            ),
            onPressed: null)
      ],
    );
  }

  Row _post_header(String username) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(postheadericonpadding),
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              getProfileImagePath(username),
            ),
            radius: profileradius,
          ),
        ),
        Expanded(child: Text(username)),
        IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.black87,
            ),
            onPressed: null),
      ],
    );
  }

  CachedNetworkImage _post_image(int index) {
    return CachedNetworkImage(
      imageUrl:
      "https://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/255/101/81255101_1565348249325_1_600x600.JPG",
      placeholder: (context, url){
        return MyProgressIndicator();
      },
      imageBuilder: (BuildContext context, ImageProvider imageProvider) =>
          AspectRatio(
            aspectRatio: 1 / 1, //이미지비율 가로:세로
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
          ),
    );
  }
}