import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  double? _deviceHeight, _deviceWidth;
  GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_textTitle(), _loginForm(), _loginButton(),_registerPageLink()],
          ),
        ),
      ),
    );
  }

  Widget _textTitle() {
    return Text(
      'F-instagram',
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 38),
    );
  }

  Widget _loginButton() {
    return MaterialButton(
      onPressed: loginUser,
      minWidth: _deviceWidth! * 0.76,
      height: _deviceHeight! * 0.06,
      color: Colors.redAccent,
      child: Text(
        'Login',
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );
  }

  Widget _loginForm() {
    return Container(
      height: _deviceHeight! * 0.20,
      child: Form(
        key: _loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _emailTextField(),
            _passwordTextField(),
          ],
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Email.....'),
      onChanged: (value) {
        setState(() {
          email = value;
        });
      },
      validator: (_value) {
        bool result = _value!.contains(
            RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'));
        return result ? null : "Please enter a valid email";
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Password **'),
      onChanged: (value) {
        setState(() {
          password = value.toString();
        });
      },
      validator: (_value) {
     return   _value!.length > 6
            ? null
            : "Please enter a password greater than 6 characters";
      },
    );
  }

  void loginUser() {
    if (_loginFormKey.currentState!.validate()) {}
  }
  Widget _registerPageLink(){
    return GestureDetector(
      onTap: ()=> Navigator.pushNamed(context, 'signup') ,
      child: Text('Dont have an account?', style: TextStyle(color: Colors.blue, fontSize: 20.0,),),
    );
  }
}
