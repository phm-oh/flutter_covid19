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
    return const MaterialApp(home: MyHomePage(title: 'Covid19 2023'));
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
// //-------------------------------------ep2-1 ปรับแต่งเสริม widget ตัวอื่นเข้าไป Column widget  Expanded widget LinearProgess widget
//---------------------------------------- 
//-----------------------------------------
//-----------------------------------------

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<Covid?>?
//       _data; //ใส่ ? 2 อัน เพื่อระบุวา สามารถเป็นค่าว่างได้ และเอาค่าว่างเติมลงไปภายหลังได้ ป้องกัน error ตอนยังดึงข้อมูลไม่เสร็จ

//   @override //initstate คือ ฟังชั้นการทำการตั้งต้นของ app ที่จะทำครั้งเดียวตอนเริ่ม
//   void initState() {
//     super.initState();
//     print('init State');
//     getData();
//   }

//   Future<void> getData() async {
//     print('getdata');
//     var url =
//         Uri.parse('https://covid19.ddc.moph.go.th/api/Cases/today-cases-all');
//     var response = await get(url);

//     print(response.body);
//     setState(() {
//       _data = covidFromJson(response.body);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('build state');

//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 247, 246, 248),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 145, 181, 16),
//         title: Center(child: Text(widget.title)),
//       ),
//       body: Column(
//         children: [
//           LinearProgressIndicator(),
//           Expanded(
//               child: ListView(
//             children: [
//               Card(
//                 color: const Color.fromRGBO(214, 91, 63, 0.659),
//                 child: ListTile(
//                   title: const Text('ผู้ติดเชื้อสะสม',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 250, 250, 250),
//                         fontSize: 24,
//                         fontWeight: FontWeight.w600,
//                       )),
//                   subtitle: Text('${_data?[0]?.totalCase ?? 'Loading'}  ราย',
//                       style: const TextStyle(
//                         color: Color.fromARGB(255, 250, 250, 250),
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                       )),
//                 ),
//               ),
//               Card(
//                 color: const Color.fromRGBO(93, 123, 224, 0.659),
//                 child: ListTile(
//                     title: const Text('รายสัปดาห์',
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 250, 250, 250),
//                           fontSize: 24,
//                           fontWeight: FontWeight.w600,
//                         )),
//                     subtitle: Text('${_data?[0]?.weeknum ?? 'Loading'}  ราย',
//                         style: const TextStyle(
//                           color: Color.fromARGB(255, 250, 250, 250),
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                         ))),
//               ),
//               Card(
//                 color: const Color.fromRGBO(163, 214, 59, 0.659),
//                 child: ListTile(
//                     title: const Text('รักษาเอง',
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 250, 250, 250),
//                           fontSize: 24,
//                           fontWeight: FontWeight.w600,
//                         )),
//                     subtitle: Text(
//                       '${_data?[0]?.caseWalkin ?? 'Loading'}  ราย',
//                       style: const TextStyle(
//                         color: Color.fromARGB(255, 250, 250, 250),
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     )),
//               ),
//               Card(
//                 color: const Color.fromRGBO(248, 2, 2, 0.66),
//                 child: ListTile(
//                   title: const Text(
//                     'เสียชีวิต',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 250, 250, 250),
//                       fontSize: 24,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   subtitle: Text(
//                     '${_data?[0]?.totalDeath ?? 'Loading'}  ราย',
//                     style: const TextStyle(
//                       color: Color.fromARGB(255, 250, 250, 250),
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )),
//         ],
//       ),
//     );
//   }
// }

//-------------------------------------
// //-------------------------------------ep2-1 สร้างเงื่อนไขใน LinearProgess 


// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<Covid?>?  _data; //ใส่ ? 2 อัน เพื่อระบุวา สามารถเป็นค่าว่างได้ และเอาค่าว่างเติมลงไปภายหลังได้ ป้องกัน error ตอนยังดึงข้อมูลไม่เสร็จ

//   @override //initstate คือ ฟังชั้นการทำการตั้งต้นของ app ที่จะทำครั้งเดียวตอนเริ่ม
//   void initState() {
//     super.initState();
//     print('init State');
//     getData();
//   }

//   Future<void> getData() async {
//     print('getdata');
//     var url = Uri.parse('https://covid19.ddc.moph.go.th/api/Cases/today-cases-all');
//     var response = await get(url);

//     print(response.body);
//     setState(() {
//       _data = covidFromJson(response.body);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('build state');

//     var indicator;                                 // ประกาศตัวอแรเพื่อเก็บค่า เช็คว่าข้อมูลมารึยัง
//     if(_data == null){
//        indicator = LinearProgressIndicator();
//     }

//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 247, 246, 248),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 145, 181, 16),
//         title: Center(child: Text(widget.title)),
//       ),
//       body: Column(
//         children: [
//          indicator ?? Container(),  // เปลี่ยนจาก LinearProgressIndicator() เป็นค่านี้
//           Expanded(
//               child: ListView(
//             children: [
//               Card(
//                 color: const Color.fromRGBO(214, 91, 63, 0.659),
//                 child: ListTile(
//                   title: const Text('ผู้ติดเชื้อสะสม',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 250, 250, 250),
//                         fontSize: 24,
//                         fontWeight: FontWeight.w600,
//                       )),
//                   subtitle: Text('${_data?[0]?.totalCase ?? 'Loading'}  ราย',
//                       style: const TextStyle(
//                         color: Color.fromARGB(255, 250, 250, 250),
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                       )),
//                 ),
//               ),
//               Card(
//                 color: const Color.fromRGBO(93, 123, 224, 0.659),
//                 child: ListTile(
//                     title: const Text('รายสัปดาห์',
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 250, 250, 250),
//                           fontSize: 24,
//                           fontWeight: FontWeight.w600,
//                         )),
//                     subtitle: Text('${_data?[0]?.weeknum ?? 'Loading'}  ราย',
//                         style: const TextStyle(
//                           color: Color.fromARGB(255, 250, 250, 250),
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                         ))),
//               ),
//               Card(
//                 color: const Color.fromRGBO(163, 214, 59, 0.659),
//                 child: ListTile(
//                     title: const Text('รักษาเอง',
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 250, 250, 250),
//                           fontSize: 24,
//                           fontWeight: FontWeight.w600,
//                         )),
//                     subtitle: Text(
//                       '${_data?[0]?.caseWalkin ?? 'Loading'}  ราย',
//                       style: const TextStyle(
//                         color: Color.fromARGB(255, 250, 250, 250),
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     )),
//               ),
//               Card(
//                 color: const Color.fromRGBO(248, 2, 2, 0.66),
//                 child: ListTile(
//                   title: const Text(
//                     'เสียชีวิต',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 250, 250, 250),
//                       fontSize: 24,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   subtitle: Text(
//                     '${_data?[0]?.totalDeath ?? 'Loading'}  ราย',
//                     style: const TextStyle(
//                       color: Color.fromARGB(255, 250, 250, 250),
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )),
//         ],
//       ),
//     );
//   }
// }

//-------------------------------------ep2-2 Future Builder


// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<Covid?>?  _data; //ใส่ ? 2 อัน เพื่อระบุวา สามารถเป็นค่าว่างได้ และเอาค่าว่างเติมลงไปภายหลังได้ ป้องกัน error ตอนยังดึงข้อมูลไม่เสร็จ

//   @override //initstate คือ ฟังชั้นการทำการตั้งต้นของ app ที่จะทำครั้งเดียวตอนเริ่ม
//   void initState() {
//     super.initState();
//     print('init State');
//     getData();
//   }

//   Future<List<Covid>> getData() async {    // เปลี่ยนจากคืนค่า void  เป็น List<covid>
//     print('getdata');
//     var url = Uri.parse('https://covid19.ddc.moph.go.th/api/Cases/today-cases-all');
//     var response = await get(url);

//     print(response.body);
//     // setState(() {
//     //   _data = covidFromJson(response.body);       //แบบเก่าลบไป
//     // });
//     var result = covidFromJson(response.body);
//     return result;  // เพิ่มการ return ค่า
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('build state');

 

//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 247, 246, 248),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 145, 181, 16),
//         title: Center(child: Text(widget.title)),
//       ),
//       body: FutureBuilder(
//         future: getData(),                 // ประกาศ prperties  future แล้วระบุว่าจะเฝ้าดูการทำงานของ funcion ไหน
//         builder:  (BuildContext context, AsyncSnapshot<dynamic> snapshot) {  
           
//             if(snapshot.connectionState == ConnectionState.done ){
//                 return Text("ได้ข้อมูลแล้ว");
//             }
//            return LinearProgressIndicator();
//       },),
//       // body: Column(
//       //   children: [
//       //    indicator ?? Container(),  // เปลี่ยนจาก LinearProgressIndicator() เป็นค่านี้
//       //     Expanded(
//       //         child: ListView(
//       //       children: [
//       //         Card(
//       //           color: const Color.fromRGBO(214, 91, 63, 0.659),
//       //           child: ListTile(
//       //             title: const Text('ผู้ติดเชื้อสะสม',
//       //                 style: TextStyle(
//       //                   color: Color.fromARGB(255, 250, 250, 250),
//       //                   fontSize: 24,
//       //                   fontWeight: FontWeight.w600,
//       //                 )),
//       //             subtitle: Text('${_data?[0]?.totalCase ?? 'Loading'}  ราย',
//       //                 style: const TextStyle(
//       //                   color: Color.fromARGB(255, 250, 250, 250),
//       //                   fontSize: 20,
//       //                   fontWeight: FontWeight.w600,
//       //                 )),
//       //           ),
//       //         ),
//       //         Card(
//       //           color: const Color.fromRGBO(93, 123, 224, 0.659),
//       //           child: ListTile(
//       //               title: const Text('รายสัปดาห์',
//       //                   style: TextStyle(
//       //                     color: Color.fromARGB(255, 250, 250, 250),
//       //                     fontSize: 24,
//       //                     fontWeight: FontWeight.w600,
//       //                   )),
//       //               subtitle: Text('${_data?[0]?.weeknum ?? 'Loading'}  ราย',
//       //                   style: const TextStyle(
//       //                     color: Color.fromARGB(255, 250, 250, 250),
//       //                     fontSize: 20,
//       //                     fontWeight: FontWeight.w600,
//       //                   ))),
//       //         ),
//       //         Card(
//       //           color: const Color.fromRGBO(163, 214, 59, 0.659),
//       //           child: ListTile(
//       //               title: const Text('รักษาเอง',
//       //                   style: TextStyle(
//       //                     color: Color.fromARGB(255, 250, 250, 250),
//       //                     fontSize: 24,
//       //                     fontWeight: FontWeight.w600,
//       //                   )),
//       //               subtitle: Text(
//       //                 '${_data?[0]?.caseWalkin ?? 'Loading'}  ราย',
//       //                 style: const TextStyle(
//       //                   color: Color.fromARGB(255, 250, 250, 250),
//       //                   fontSize: 20,
//       //                   fontWeight: FontWeight.w600,
//       //                 ),
//       //               )),
//       //         ),
//       //         Card(
//       //           color: const Color.fromRGBO(248, 2, 2, 0.66),
//       //           child: ListTile(
//       //             title: const Text(
//       //               'เสียชีวิต',
//       //               style: TextStyle(
//       //                 color: Color.fromARGB(255, 250, 250, 250),
//       //                 fontSize: 24,
//       //                 fontWeight: FontWeight.w600,
//       //               ),
//       //             ),
//       //             subtitle: Text(
//       //               '${_data?[0]?.totalDeath ?? 'Loading'}  ราย',
//       //               style: const TextStyle(
//       //                 color: Color.fromARGB(255, 250, 250, 250),
//       //                 fontSize: 20,
//       //                 fontWeight: FontWeight.w600,
//       //               ),
//       //             ),
//       //           ),
//       //         ),
//       //       ],
//       //     )),
//       //   ],
//       // ),
//     );
//   }
// }


//-------------------------------------ep2-3 Future Builder  -----------------

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //  List<Covid?>?  _data; //ไม่ได้ใช้เพราะ getData เปลี่ยนไปใช้ result แทน

  @override //initstate คือ ฟังชั้นการทำการตั้งต้นของ app ที่จะทำครั้งเดียวตอนเริ่ม
  void initState() {
    super.initState();
    print('init State');
    getData();
  }

  Future<List<Covid>> getData() async {    // เปลี่ยนจากคืนค่า void  เป็น List<covid>
    print('getdata');
    var url = Uri.parse('https://covid19.ddc.moph.go.th/api/Cases/today-cases-all');
    var response = await get(url);

    print(response.body);
    // setState(() {
    //   _data = covidFromJson(response.body);       //แบบเก่าลบไป
    // });
    
     var result = covidFromJson(response.body);
     return result;  // เพิ่มการ return ค่า
  }

  @override
  Widget build(BuildContext context) {
    print('build state');

 

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 246, 248),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 145, 181, 16),
        title: Center(child: Text(widget.title)),
      ),
      body: FutureBuilder(
        future: getData(),                
        builder:  (BuildContext context, AsyncSnapshot<List<Covid>> snapshot) { //เปลียนชนิดข้อมูลจาก dynamic เป็น <List<Covid>>
           
            if(snapshot.connectionState == ConnectionState.done ){

                  var result = snapshot.data;   //snapshot.data  คือข้อมูลของ Future
   
                return  ListView(
            children: [
              Card(
                color: const Color.fromRGBO(214, 91, 63, 0.659),
                child: ListTile(
                  title: const Text('ผู้ติดเชื้อสะสม',
                      style: TextStyle(
                        color: Color.fromARGB(255, 250, 250, 250),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      )),
                  subtitle: Text('${result?[0]?.totalCase ?? 'Loading'}  ราย',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 250, 250, 250),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ),
              Card(
                color: const Color.fromRGBO(93, 123, 224, 0.659),
                child: ListTile(
                    title: const Text('รายสัปดาห์',
                        style: TextStyle(
                          color: Color.fromARGB(255, 250, 250, 250),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        )),
                    subtitle: Text('${result?[0]?.weeknum ?? 'Loading'}  ราย',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 250, 250, 250),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ))),
              ),
              Card(
                color: const Color.fromRGBO(163, 214, 59, 0.659),
                child: ListTile(
                    title: const Text('รักษาเอง',
                        style: TextStyle(
                          color: Color.fromARGB(255, 250, 250, 250),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        )),
                    subtitle: Text(
                      '${result?[0]?.caseWalkin ?? 'Loading'}  ราย',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 250, 250, 250),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ),
              Card(
                color: const Color.fromRGBO(248, 2, 2, 0.66),
                child: ListTile(
                  title: const Text(
                    'เสียชีวิต',
                    style: TextStyle(
                      color: Color.fromARGB(255, 250, 250, 250),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    '${result?[0]?.totalDeath ?? 'Loading'}  ราย',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 250, 250, 250),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ) ;
            }
           return LinearProgressIndicator();
      },),
      // body: Column(
      //   children: [
      //    indicator ?? Container(),  
      //     Expanded(
          //     child: ListView(
          //   children: [
          //     Card(
          //       color: const Color.fromRGBO(214, 91, 63, 0.659),
          //       child: ListTile(
          //         title: const Text('ผู้ติดเชื้อสะสม',
          //             style: TextStyle(
          //               color: Color.fromARGB(255, 250, 250, 250),
          //               fontSize: 24,
          //               fontWeight: FontWeight.w600,
          //             )),
          //         subtitle: Text('${_data?[0]?.totalCase ?? 'Loading'}  ราย',
          //             style: const TextStyle(
          //               color: Color.fromARGB(255, 250, 250, 250),
          //               fontSize: 20,
          //               fontWeight: FontWeight.w600,
          //             )),
          //       ),
          //     ),
          //     Card(
          //       color: const Color.fromRGBO(93, 123, 224, 0.659),
          //       child: ListTile(
          //           title: const Text('รายสัปดาห์',
          //               style: TextStyle(
          //                 color: Color.fromARGB(255, 250, 250, 250),
          //                 fontSize: 24,
          //                 fontWeight: FontWeight.w600,
          //               )),
          //           subtitle: Text('${_data?[0]?.weeknum ?? 'Loading'}  ราย',
          //               style: const TextStyle(
          //                 color: Color.fromARGB(255, 250, 250, 250),
          //                 fontSize: 20,
          //                 fontWeight: FontWeight.w600,
          //               ))),
          //     ),
          //     Card(
          //       color: const Color.fromRGBO(163, 214, 59, 0.659),
          //       child: ListTile(
          //           title: const Text('รักษาเอง',
          //               style: TextStyle(
          //                 color: Color.fromARGB(255, 250, 250, 250),
          //                 fontSize: 24,
          //                 fontWeight: FontWeight.w600,
          //               )),
          //           subtitle: Text(
          //             '${_data?[0]?.caseWalkin ?? 'Loading'}  ราย',
          //             style: const TextStyle(
          //               color: Color.fromARGB(255, 250, 250, 250),
          //               fontSize: 20,
          //               fontWeight: FontWeight.w600,
          //             ),
          //           )),
          //     ),
          //     Card(
          //       color: const Color.fromRGBO(248, 2, 2, 0.66),
          //       child: ListTile(
          //         title: const Text(
          //           'เสียชีวิต',
          //           style: TextStyle(
          //             color: Color.fromARGB(255, 250, 250, 250),
          //             fontSize: 24,
          //             fontWeight: FontWeight.w600,
          //           ),
          //         ),
          //         subtitle: Text(
          //           '${_data?[0]?.totalDeath ?? 'Loading'}  ราย',
          //           style: const TextStyle(
          //             color: Color.fromARGB(255, 250, 250, 250),
          //             fontSize: 20,
          //             fontWeight: FontWeight.w600,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // )
      // ),
      //   ],
      // ),
    );
  }
}