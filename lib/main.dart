import 'package:flutter/material.dart';
import 'package:two_day_flutter/Login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   GlobalKey<FormState> formkey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.blueAccent,
//         leading: Icon(Icons.add),
//         title: Text(" MY FLUTTER APP", style: TextStyle(color: Colors.white)),
//         actions: [Icon(Icons.access_alarm_sharp)],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Form(
//           key: formkey,
//           child: Column(
//             children: [
//               TextFormField(
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter password';
//                   }
//                 },
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   labelText: " password",
//                   hintText: "enter password",
//                   labelStyle: TextStyle(color: Colors.black),
//                   prefixIcon: Icon(Icons.person, color: Colors.black),
//                   suffixIcon: Icon(Icons.remove_red_eye, color: Colors.black),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (formkey.currentState!.validate()) {
//                     print("Paassword");
//                   }
//                   setState(() {
//                     formkey.currentState!.save();
//                   });
//                 },
//                 child: Text("login"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
