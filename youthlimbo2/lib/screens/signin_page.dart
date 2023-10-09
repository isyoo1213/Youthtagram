import 'package:flutter/material.dart';
import 'package:youthlimbo2/screens/signup_page.dart';
import 'package:youthlimbo2/widgets/signin_form.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SignInForm(),
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
            final route = MaterialPageRoute(builder: (context)=> SignUpPage());
            Navigator.pushReplacement(context, route);
          },
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: TextStyle(), //왠지 모르겠지만 기본적으로 텍스트스타일 생성해서 줘야함
                  children: <TextSpan>[
                    TextSpan(
                      text: "아이디가 없으신가요?  ",
                      style: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.black54
                      ),
                    ),
                    TextSpan(
                        text: '회원가입',
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
