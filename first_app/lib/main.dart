import 'package:flutter/material.dart';


void main() {
  runApp(
    const MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: SafeArea(
        child: MyScaffold(),
      ),
    ),
  );
}

class MyScaffold extends StatefulWidget {
  const MyScaffold({super.key});

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  int cnt=0;
  void incre(){
    setState(() {
      cnt++;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Column(
      
      // Column is a vertical, linear layout.
        children: [
          MyAppBar(
            title: Text(
              'Menu',
              style: Theme.of(context) //
                  .primaryTextTheme
                  .titleLarge,
            ),
          ),
            ElevatedButton(
            onPressed:incre,
            // icon:Icon(Icons.add),
            child : Text('Count : $cnt'),
            ),
          const Expanded(
            child: Center(
              child: Text('Hello, world! '),
            ),
          ),

        ],
    );
  }
}


class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, super.key});

  // Fields in a Widget subclass are always marked "final".

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Color.fromARGB(255, 93, 147, 190)),
      // Row is a horizontal, linear layout.
      child: Row(
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null disables the button
          ),
          // Expanded expands its child
          // to fill the available space.
          Expanded(
            child: title,
          ),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
          
        ],
      ),
    );
  }
}

