import 'package:flutter/material.dart';
import 'package:youthlimbo2/utils/profile_image_path.dart';
import 'file:///E:/flutter_workspace/youthlimbo2/lib/constants/size.dart';

class Comment extends StatelessWidget {
  final String username;
  final bool showprofile;
  final DateTime dateTime;
  final String caption;

  const Comment(
      {Key key,
        @required this.username,
        this.showprofile = false,
        this.dateTime,
        @required this.caption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Visibility(
          visible: showprofile,
          child: CircleAvatar(
            backgroundImage: NetworkImage(getProfileImagePath(username)),
            radius: profileradius,
          ),
        ),
        Visibility(
            visible: showprofile,
            child: SizedBox(
              width: common_gap,
            )),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: username,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: '    '),
                        TextSpan(text: caption),
                      ])),
              SizedBox(height: common_gap_s),
              Visibility(
                  visible: dateTime != null,
                  child: dateTime == null
                      ? SizedBox()
                      : Text(
                    dateTime.toIso8601String(),
                    style:
                    TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ))
            ],
          ),
        )
      ],
    );
  }
}