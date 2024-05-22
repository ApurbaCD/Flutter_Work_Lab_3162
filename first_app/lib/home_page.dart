import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text('fluter cointainer'),
      ),
      body:Center(
        child:Container(
        width: 250,
        height: 50,
        color:Colors.limeAccent,
        child: Center(child: Text('hello guys',style:TextStyle(fontSize: 30))),
      ),
      )

    );
  }
}
