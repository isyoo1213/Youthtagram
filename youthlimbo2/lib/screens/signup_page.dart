import 'package:flutter/material.dart';
import 'package:youthlimbo2/screens/signin_page.dart';
import 'package:youthlimbo2/widgets/signup_form.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SignUpForm(),
            _goTOSignUpPageButton(context)
          ],
        ),
      ),
    );
  }

  Positioned _goTOSignUpPageButton(BuildContext context){
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: 40,
      child: FlatButton(
          shape: Border(top: BorderSide(color: Colors.grey[300])),
          onPressed: (){
            final route = MaterialPageRoute(builder: (context)=> SignInPage());
            Navigator.pushReplacement(context, route);
          },
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: TextStyle(), //왠지 모르겠지만 기본적으로 텍스트스타일 생성해서 줘야함
                  children: <TextSpan>[
                    TextSpan(
                      text: "이미 아이디가 있으신가요?  ",
                      style: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.black54
                      ),
                    ),
                    TextSpan(
                        text: '로그인',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue[600]
                        )
                    ),
                    TextSpan(
                      text: "을 해보세요!",
                      style: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.black54
                      ),
                    ),
                  ]
              ))
      ),
    );
  }

}
