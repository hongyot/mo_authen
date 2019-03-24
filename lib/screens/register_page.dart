import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert'; //ุชุดคำสั่งในการ convert เป็น String และอ่าน Json ได้

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey =
      GlobalKey<FormState>(); //จำทำ validator ใน form สำหรับ Register

  String nameString;
  String emailString;
  String passwordString;

  Widget nameTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name : ', hintText: 'Full Name'),
      validator: (String value) {
        if (value.length == 0) {
          return 'Please fill your name ?';
        }
      },
      onSaved: (String value) {
        // onsave จะทำงานเมื่อ validator เป็น true เท่านั้น
        nameString = value.trim();
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
      onSaved: (String value) {
        emailString = value.trim().toLowerCase();
      },
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password', hintText: 'More than 6 Charector'),
      validator: (String value) {
        if (value.length <= 5) {
          return 'Please fill your password more than 5 charator';
        }
      },
      onSaved: (String value) {
        passwordString = value.trim();
      },
    );
  }

  void sentValueToServer(BuildContext context) async {
    //async เป็นการทำซ้ำ รอค่า
    print('send value');
    print(formkey.currentState.validate());

    if (formkey.currentState.validate()) {
      print('upload to server');
      formkey.currentState.save(); // ต้องให้ formkey ทำ save จากการป้อนค่า
      String urlString =
          'https://www.androidthai.in.th/mo/addDataMo.php?isAdd=true&Name=$nameString&User=$emailString&Password=$passwordString';
      print(urlString);
      var response = await get(
          urlString); // เป็นการ await เพื่อรอ ให้การทำงานขอ website สำเร็จก่อน
      var result = json.decode(response.body); //เป็นการอ่าน Json ที่ Body ดูว่า เป็น true and false
      print('result =  $result');
      if (result.toString()=='true') {
        Navigator.pop(context); //กลีบหน้าแรก
        
      }
    }
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
                sentValueToServer(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
