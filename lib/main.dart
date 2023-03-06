import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:covid19/covid_2023.dart';

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
//--------------------------------------------
//--------------------------------------------ep1-1  init project


// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 192, 207, 139),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 115, 145, 7),
//         title: Center(child: Text(widget.title)),

//       ),
//       body:ListView(
//         children: const [
//              Card(
//                child:ListTile(
//                 title: Text('ผู้ติดเชื้อสะสม'),
//                 subtitle:Text('0')
//               ),     
//              ), 
//               Card(
//                child:ListTile(
//                 title: Text('หายแล้ว'),
//                 subtitle:Text('0')
//               ),        
//              ), 
//              Card(
//                child:ListTile(
//                 title: Text('กำลังรักษา'),
//                 subtitle:Text('0')
//               ),        
//              ),
//              Card(
//                child:ListTile(
//                 title: Text('เสียชีวิต'),
//                 subtitle:Text('0')
//               ),        
//              ),
             

//         ],
//       ),
//     );
//   }
// }

// //-------------------------------------
// //-------------------------------------ep1-2 initState //initstate คือ ฟังชั้นการทำการตั้งต้นของ app ที่จะทำครั้งเดียวตอนเริ่ม
//---------------------------------------- ep นี้ต้องติดตั้ง  http package ที่  https://pub.dev/packages/http
//-----------------------------------------ข้อมูล covid https://www.nextflow.in.th/api/covid19/getTodayCases.json
//-----------------------------------------https://covid19.ddc.moph.go.th/api/Cases/today-cases-all

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   List<Covid?>? _data ;   //ใส่ ? 2 อัน เพื่อระบุวา สามารถเป็นค่าว่างได้ และเอาค่าว่างเติมลงไปภายหลังได้ ป้องกัน error ตอนยังดึงข้อมูลไม่เสร็จ


  @override //initstate คือ ฟังชั้นการทำการตั้งต้นของ app ที่จะทำครั้งเดียวตอนเริ่ม
  void initState(){
    super.initState();
    print('init State');
    getData();
  }

  Future<void> getData() async {
   print('getdata');
    var url = Uri.parse('https://covid19.ddc.moph.go.th/api/Cases/today-cases-all');
    var response = await get(url);
       
    print(response.body);
    setState(() {
       _data =  covidFromJson(response.body);
    });

   
    
  }


  @override
  Widget build(BuildContext context) {

    print('build state');

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 192, 207, 139),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 115, 145, 7),
        title: Center(child: Text(widget.title)),

      ),
      body:ListView(
        children:  [
             Card(
               child:ListTile(
                title: Text('ผู้ติดเชื้อสะสม'),
                subtitle:Text('${_data?[0]?.totalCase ?? 'Loading'}'),
              ),     
             ), 
              Card(
               child:ListTile(
                title: Text('รายสัปดาห์'),
                subtitle:Text('${_data?[0]?.weeknum ?? 'Loading'}')
              ),        
             ), 
             Card(
               child:ListTile(
                title: Text('รักษาเอง'),
                subtitle:Text('${_data?[0]?.caseWalkin ?? 'Loading'}')
              ),        
             ),
             Card(
               child:ListTile(
                title: Text('เสียชีวิต'),
                subtitle:Text('${_data?[0]?.totalDeath ?? 'Loading'}')
              ),        
             ),
             

        ],
      ),
    );
  }
}

//-------------------------------------
//-------------------------------------

