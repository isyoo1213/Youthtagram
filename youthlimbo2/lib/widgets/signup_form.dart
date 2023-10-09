import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:youthlimbo2/utils/simple_snack_bar.dart';
import 'file:///E:/flutter_workspace/youthlimbo2/lib/constants/size.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SigninFoemState createState() => _SigninFoemState();
}

class _SigninFoemState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _cpwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    _cpwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Spacer(
                  flex: 3,
                ),
                SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset('assets/youth_logo.png')),
                Spacer(
                  flex: 4,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: getTextFieldDecor('E-mail'),
                  validator: (String value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return '올바른 형식의 이메일을 입력해주세요!';
                    }
                    return null;
                  }, //Form과 TextFomfield를 사용하는 제일 중요한 이유
                ),
                Spacer(
                  flex: 1,
                ),
                TextFormField(
                  obscureText: true,
                  controller: _pwController,
                  decoration: getTextFieldDecor('Password'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return '비밀번호를 입력해주세요!';
                    }
                    return null;
                  },
                ),
                Spacer(
                  flex: 1,
                ),
                TextFormField(
                  obscureText: true,
                  controller: _cpwController,
                  decoration: getTextFieldDecor('Confirm Password'),
                  validator: (String value) {
                    if (value.isEmpty || value !=_pwController.text) {
                      return '비밀번호가 일치하지 않습니다!';
                    }
                    return null;
                  },
                ),
                Spacer(
                  flex: 1,
                ),
                Spacer(
                  flex: 2,
                ),
                FlatButton(
                  onPressed: (){//이제 formKey를 가져와서 formstate를 확인 후 validate트리거 작동. formkey 생성자 확인. 오류없을 시 true 리턴함.
                    if(_formKey.currentState.validate()){
                      _register;
                    }
                  },
                  child: Text(
                    'Join',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      left: 0,
                      right: 0,
                      height: 1,
                      child: Container(
                        color: Colors.grey[300],
                        height: 1,
                      ),
                    ),
                    Container(
                        height: 3,
                        width: 50,
                        color: Colors.grey[50]
                    ),
                    Text(
                      'OR',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                Spacer(
                  flex: 1,
                ),
                FlatButton.icon(
                  onPressed: (){
                    simpleSnackBar(context, 'FaceBook Pressed!'); // 여튼 스낵바 쓸때는 스캐폴드 안에서 써야됨.
                  },
                  textColor: Colors.blue,
                  icon: ImageIcon(AssetImage('assets/icon/facebook.png'),),
                  label: Text("FaceBook으로 로그인"),),
                Spacer(
                  flex: 6,
                ),
              ],
            )),
      ),
    );
  }

  get _register async {
    final AuthResult result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _pwController.text);
    final FirebaseUser user = result.user;

    if(user==null){
      simpleSnackBar(context, '다음에 다시 시도해주세요!');
    }

  }

  InputDecoration getTextFieldDecor(String hint) {
    return InputDecoration(
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[300],
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[300],
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        fillColor: Colors.grey[100],
        filled: true);
  }
}