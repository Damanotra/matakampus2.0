import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  onTabLogin(){
    print("login tabbed");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildLoginPage()

      ),
    );
  }

  Widget _buildLoginPage(){
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: false,
        padding: EdgeInsets.symmetric(horizontal: 40,vertical: 120),
        children: <Widget>[
          Image.asset('assets/image/logo-trans.png'),
          SizedBox(height: 72),
          Container(width: double.infinity,child: Text('Email',style: TextStyle(fontSize: 16),textAlign: TextAlign.start)),
          SizedBox(height: 8),
          _buildEmailField(),
          SizedBox(height: 16),
          Container(width: double.infinity,child: Text('Password',style: TextStyle(fontSize: 16),textAlign: TextAlign.start)),
          SizedBox(height: 8),
          _buildPasswordField(),
          SizedBox(height: 56),
          _buildLoginButton()
        ],
      ),
    );
  }
  

  Widget _buildLoginButton(){
    return FlatButton(
            child: Container(
              height: 60, 
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                'LOG IN',
                style: TextStyle(color: Colors.white)
              ),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            onPressed: (){
              print('Pencet login');
              Navigator.pushNamedAndRemoveUntil(context, '/home', (Route<dynamic> route) => false);
            },
            color: Colors.orange);
  }

  Widget _buildPasswordField(){
    return Row(children: <Widget>[
            Icon(Icons.lock,size: 32,color: Colors.black),
            SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4)
                  )
                ),
                controller: _passwordController,
                onSaved: (value){
                  _passwordController.text = value;
                },
                validator: (value){
                  if(value.isEmpty){
                    return 'Passwordnya masih kosong nih kak';
                  } else{
                    return null;
                  }
                },
                onEditingComplete: (){
                  _formKey.currentState.validate();
                },
              ),
            )
          ],
          );
  }

  Widget _buildEmailField(){
    return Row(children: <Widget>[
            Icon(Icons.email,size: 32,color: Colors.black),
            SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4)
                  ),
                ),
                controller: _emailController,
                onSaved: (value){
                _emailController.text = value;
                },
                validator: (value){
                  if(value.isEmpty){
                    return 'Email gaboleh kosong kak';
                  } else if(!value.contains('@')){
                    return 'Duh kok ngga ada @ nya';
                  } else{
                    return null;
                  }
                },
                onEditingComplete: (){
                  _formKey.currentState.validate();
                },
                autocorrect: false,
                autofocus: true,
              ),
            )
          ],
          );
  }
}


