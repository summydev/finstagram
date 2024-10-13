import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignupPageState();
  }
}

class _SignupPageState extends State<SignupPage> {
  double? _deviceHeight, _deviceWidth;
  final GlobalKey<FormState> _signupFormkey = GlobalKey<FormState>();
  String? name,email, password;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [_textTitle(),_signupForm(), _signupButton()],
          ),
        ),
      )),
    );
  }

  Widget _textTitle() {
    return Text(
      'F-instagram',
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 38),
    );
  }

  Widget _signupButton() {
    return MaterialButton(
      onPressed: () {},
      minWidth: _deviceWidth! * 0.50,
      height: _deviceHeight! * 0.05,
      color: Colors.redAccent,
      child: Text(
        'Reister Here',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
      ),
    );
  }
  Widget _signupForm(){
    return Container(
      height: _deviceHeight!*0.30,
      child: Form(
        key: _signupFormkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [_nameTextField(),_emailTextField(),_passwordTextField()],
        ),
      ),
    );
  }
  Widget _nameTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Name'
      ),
      validator: (value)=> value!.length > 0 ? null : 'please enter a name' ,
      onSaved: (value){
        setState(() {
          name= value;
        });
      },
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

}
