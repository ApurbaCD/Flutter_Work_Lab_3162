import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of todo tasks
  List toDoList=[
    ['make tutorial',false],
    ['do exercise',false],
  ];
  //checkbox was tapped 
  void checkboxchanged( bool? value , index){
    setState(() {
      toDoList[index][1]=!toDoList[index][1];
    });
  }
  void createNewTask(){
    showDialog(
      context: context,
      builder: (context){
        return DialogBox();
      },
      );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('todo '),
        elevation: 0,
      ),
      floatingActionButton:FloatingActionButton(
        onPressed:createNewTask,
        child: Icon(Icons.add),
      ), 
      body:ListView.builder(
        itemCount: toDoList.length,
        itemBuilder:(context, index){
          return ToDoList(taskName: toDoList[index][0], 
          taskCompleted: toDoList[index][1], 
          onChange: (value)=>checkboxchanged(value,index),
          );
        },
      )
    );
  }
}

class ToDoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChange;

  ToDoList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChange,
    });
  
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12)
          ),
        child: Row(
          children: [
            //checkbox 
            Checkbox(
              value: taskCompleted,
              onChanged: onChange,
              activeColor: Colors.black,
              ),
            //task name
            Text(
              taskName,
              style: TextStyle(decoration:  taskCompleted? TextDecoration.lineThrough :TextDecoration.none),
              ),
          ],
        ),
      ),
    );
  }
}
 class DialogBox extends StatelessWidget{
  const DialogBox({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content:Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border:OutlineInputBorder(),
                hintText: 'Add a new task',
                ),
            ),
            Row(children: [

            ],)
          ],
        ),
        ),
    );
  }
 }

class MyButton extends StatelessWidget{
  final String text;
  VoidCallback onPressed;
  MyButton({
    super.key, 
    required this.text, 
    required this.onPressed
    });
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
