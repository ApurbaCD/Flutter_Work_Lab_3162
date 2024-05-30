import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:first_app/All_string.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
List s=Other.list1;
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
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  //  List s=Other.list1;
  // text controller 
  final  _controller = TextEditingController();
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
  // save new task 
  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text,false]);
       _controller.clear();
    });
    Navigator.of(context).pop();
  }
  void createNewTask(){
    showDialog(
      context: context,
      builder: (context){
        return DialogBox(
          controller: _controller ,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
      );
  }
  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  void bangla_changer(){
    setState(() {
      s=Other.list1;
    });
    
  }
  void english_changer(){
    setState(() {
     s=Other.list2;
    });
   
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Color.fromARGB(255, 123, 177, 179), 
      floatingActionButton:Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(onPressed: bangla_changer, child: Text('Bangla')),
          TextButton(onPressed: english_changer, child: Text('English')), 
          FloatingActionButton(
            onPressed:createNewTask,
            child: Icon(
              Icons.add
              ),
          ),
        ],
      ), 
       appBar: AppBar(
        title: Text(s[0]),
        elevation: 0,
      ),
      body:ListView.builder(
        itemCount: toDoList.length,
        itemBuilder:(context, index){
          return ToDoList(taskName: toDoList[index][0], 
          taskCompleted: toDoList[index][1], 
          onChange: (value)=>checkboxchanged(value,index),
          deleteFunction: (context)=> deleteTask(index),
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
  Function(BuildContext)? deleteFunction;
  ToDoList({
    super.key,
    required this.taskName,data,
    required this.taskCompleted,
    required this.onChange,
    required this.deleteFunction,
    });
  
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
      // child: Slidable(
      //   endActionPane: ActionPane(
      //     motion: StretchMotion(),
      //     children: [
      //       SlidableAction(
      //         onPressed: deleteFunction,
      //         icon:Icons.delete,
      //         backgroundColor: Colors.red.shade300,
      //         borderRadius: BorderRadius.circular(12),
      //         )
      //     ],
      //   ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 248, 248, 248),
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
                style: TextStyle(fontSize: 20,decoration:  taskCompleted? TextDecoration.lineThrough :TextDecoration.none),
                ),
            ],
          ),
        ),
      //),
    );
  }
}
 class DialogBox extends StatelessWidget{
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key,required this.controller,required this.onSave,required this.onCancel});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content:Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
                controller: controller,
                decoration: InputDecoration(
                border:OutlineInputBorder(),
                hintText:s[1],
                ),
            ),
            //button -> save + cancl
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              MyButton(text: s[2], onPressed:onSave),
              const SizedBox(width: 8),
              MyButton(text: s[3], onPressed:onCancel),
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
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}

// class Language extends StatelessWidget{
//   void bangla_changer(){
//     print("ok");
//   }
//   void english_changer(){
//     print("ok");
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  Row(
//       children: [
//           TextButton(onPressed: bangla_changer, child: Text('Bangla')),
//           TextButton(onPressed: english_changer, child: Text('English')),          
//       ],
//     );
//   }
// }