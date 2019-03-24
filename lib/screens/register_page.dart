import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey = GlobalKey<FormState>();

  Widget nameTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name : ', hintText: 'Full Name'),
      validator: (String value) {
        if (value.length == 0) {
          return 'Please fill your name ?';
        }
      },
    );
  }

  Widget emailTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Email : ', hintText: 'You@email.com'),
      validator: (String value) {
        if (!value.contains('@')) {
          return 'Please fill your Email?';
        }
      },
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password', hintText: 'More than 6 Charector'),validator: (String value){
            if (value.length <=5) {
              return 'Please fill your password more than 5 charator';
            }
          },
    );
  }

  void sentValueToServer(
      BuildContext context, String name, String email, String password) {
    print('send value');

    print(formkey.currentState.validate());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
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
            IconButton(
              tooltip: 'Upload Register Informaiton',
              icon: Icon(Icons.cloud_upload),
              onPressed: () {
                print('Click upload');
                sentValueToServer(context, 'test', 'test', 'test');
              },
            )
          ],
        ),
      ),
    );
  }
}
