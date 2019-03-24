import 'package:flutter/material.dart';
import 'screens/register_page.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'models/user_model.dart';
import 'screens/service.dart';

// void main() {
//   runApp(App());
// }

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MO Authen',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formkey = GlobalKey<FormState>();
  final myScaffoldsnackbar = GlobalKey<ScaffoldState>();

  String email;
  String password;

  Widget Showlogo() {
    return Image.asset('images/korea.png');
  }

  Widget ShowTitle() {
    return Text(
      'Korea Language Online School',
      style: TextStyle(
          fontFamily: 'Itim',
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.red[900]),
    );
  }

  Widget EmailTextField() {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      decoration:
          InputDecoration(labelText: 'Email : ', hintText: 'you@email.com'),
      validator: (String value) {
        if (!value.contains('@')) {
          return 'Please fill Email';
        }
        ;
      },
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget passwordTextFiedl() {
    return TextFormField(
      obscureText: true,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          labelText: 'Password : ', hintText: 'More than 6 Charactor'),
      validator: (String value) {
        if (value.length <= 5) {
          return 'Password less than 6 charator';
        }
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget signupButton(BuildContext context) {
    return RaisedButton(
      child: Text(
        'Sign Up',
        style: TextStyle(
            fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black45),
      ),
      onPressed: () {
        print('You Clikc Singup');
        var registerroute = new MaterialPageRoute(
            builder: (BuildContext context) => RegisterPage());
        Navigator.of(context).push(registerroute);
      },
    );
  }

  Widget signinButton(BuildContext context) {
    return RaisedButton(
      color: Colors.redAccent,
      child: Text(
        'Sign In',
        style: TextStyle(
            fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white70),
      ),
      onPressed: () {
        print('You Click Singin');
        checkAuthen(context);
      },
    );
  }

  void checkAuthen(BuildContext context) async {
    print(formkey.currentState.validate());

    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      print('email = $email & $password ');

      String urlauthen =
          'https://www.androidthai.in.th/mo/getUserWhereUserMo.php?isAdd=true&User=$email';
      var response = await get(urlauthen);
      var result = json.decode(response.body);
      print(result);
      if (result.toString() == 'null') {
        showSnackbar('Wrong Username');
      } else {
        String truePassword = '';
        String nameString = '';

        for (var data in result) {
          print('data => $data');
          var userModel = UserModel.fromJson(data);
          truePassword = userModel.password.toString();
          nameString = userModel.name.toString();

          if (password == truePassword) {
            // password true
            showSnackbar('Welcome $nameString');
            var serviceRoute = new MaterialPageRoute(
                builder: (BuildContext context) => Service(nameLoginString: nameString,));
                Navigator.of(context).push(serviceRoute);
          } else {
            showSnackbar('Wrong Password');

            // password fase
          }
        }
      }
    } // if 1
  }

  void showSnackbar(String message) {
    print(message);
    final snackBar = new SnackBar(
      duration: new Duration(seconds: 2),
      backgroundColor: Colors.orange[900],
      content: Text(message),
    );
    myScaffoldsnackbar.currentState.showSnackBar(snackBar);
  } //คล้าย Toast

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        key: myScaffoldsnackbar,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white30, Colors.black45],
                  begin: Alignment(-1, 1))),
          padding: EdgeInsets.only(top: 80.0),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Showlogo(),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: ShowTitle(),
              ),
              Container(
                  margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0),
                  child: EmailTextField()),
              Container(
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
                child: passwordTextFiedl(),
              ),
              Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new Expanded(
                      child: Container(
                        child: signinButton(context),
                      ),
                    ),
                    new Expanded(
                      child: signupButton(context),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
