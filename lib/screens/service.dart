import 'package:flutter/material.dart';

class Service extends StatefulWidget {

final String nameLoginString ;

Service({Key key,this.nameLoginString}) :super(key:key );


  @override
  _ServiceState createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('This my body Login by ${widget.nameLoginString}'),
      appBar: AppBar(
        title: Text('${widget.nameLoginString}'),
      ),
    );
  }
}
