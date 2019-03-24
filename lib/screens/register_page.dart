import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Widget nameTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name : ', hintText: 'Full Name'),
    );
  }

  Widget emailTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Email : ', hintText: 'You@email.com'),
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password', hintText: 'More than 6 Charector'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white30, Colors.black45],
                begin: Alignment(-1, 1))),
        padding: EdgeInsets.only(left: 50.0, top: 50.0, right: 50.0),
        child: Column(
          children: <Widget>[
            nameTextField(),
            emailTextField(),
            passwordTextField()
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Register'),
        actions: <Widget>[
          IconButton(tooltip: 'Upload Register Informaiton',
            icon: Icon(Icons.cloud_upload),
            onPressed: () {
              print('Click upload');
            },
          )
        ],
      ),
    );
  }
}
