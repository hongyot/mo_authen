import 'package:flutter/material.dart';
import 'screens/register_page.dart';

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
      decoration:
          InputDecoration(labelText: 'Email : ', hintText: 'you@email.com'),
    );
  }

  Widget passwordTextFiedl() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password : ', hintText: 'More than 6 Charactor'),
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

  Widget signinButton() {
    return RaisedButton(
      color: Colors.redAccent,
      child: Text(
        'Sign In',
        style: TextStyle(
            fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white70),
      ),
      onPressed: () {
        print('You Click Singin');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.yellow[300], Colors.yellow[800]],
                begin: Alignment(-1, -1))),
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
                  Container(
                    alignment: Alignment.centerRight,
                    child: signinButton(),
                  ),
                  signupButton(context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
