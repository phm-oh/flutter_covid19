import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      home: MyHomePage(
        title:'Covid19 2023'
      )
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 192, 207, 139),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 115, 145, 7),
        title: Center(child: Text(widget.title)),

      ),
      body:ListView(
        children: const [
             Card(
               child:ListTile(
                title: Text('ผู้ติดเชื้อสะสม'),
                subtitle:Text('0')
              ),     
             ), 
              Card(
               child:ListTile(
                title: Text('หายแล้ว'),
                subtitle:Text('0')
              ),        
             ), 
             Card(
               child:ListTile(
                title: Text('กำลังรักษา'),
                subtitle:Text('0')
              ),        
             ),
             Card(
               child:ListTile(
                title: Text('เสียชีวิต'),
                subtitle:Text('0')
              ),        
             ),
             

        ],
      ),
    );
  }
}
