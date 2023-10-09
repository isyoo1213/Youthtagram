import 'package:flutter/material.dart';
import 'package:youthlimbo2/widgets/signin_form.dart';
import 'package:youthlimbo2/widgets/signup_form.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  Widget currentWidget = SignInForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: currentWidget),
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
            setState(() {
              if(currentWidget is SignInForm){
                currentWidget = SignUpForm();
              } else {
                currentWidget = SignInForm();
              }
            });
          },
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: TextStyle(), //기본적으로 텍스트스타일 생성해서 줘야함
                  children: <TextSpan>[
                    TextSpan(
                      text: (currentWidget is SignInForm)?
                      "아이디가 없으신가요?  ":"이미 아이디가 있으신가요?  " ,
                      style: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.black54
                      ),
                    ),
                    TextSpan(
                        text: (currentWidget is SignInForm)?'회원가입':'로그인',
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