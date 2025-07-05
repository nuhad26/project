// import 'dart:convert';
//
//
// import 'package:edumoodmonitoring/newhome.dart';
// import 'package:flutter/material.dart';
//
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
// import 'home.dart';
//
// class login extends StatefulWidget {
//   const login({super.key});
//
//   @override
//   State<login> createState() => _loginState();
// }
//
// class _loginState extends State<login> {
//
//
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Login"),
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller: usernameController,
//                   decoration: const InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(),
//                     hintText: "Username",
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller: passwordController,
//                   decoration: const InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(),
//                     hintText: "Password",
//                   ),
//                 ),
//               ),
//               Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: ElevatedButton(
//                         onPressed: ()async {
//                           final sh = await SharedPreferences.getInstance();
//                           String Uname=usernameController.text.toString();
//                           String Passwd=passwordController.text.toString();
//                           String url = sh.getString("url").toString();
//                           print("okkkkkkkkkkkkkkkkk");
//                           var data = await http.post(
//                               Uri.parse(url+"androidlogin_post"),
//                               body: {'username':Uname,
//                                 "password":Passwd,
//                               });
//                           var jasondata = json.decode(data.body);
//                           String status=jasondata['status'].toString();
//                           String type=jasondata['type'].toString();
//                           if(status=="ok") {
//                             if (type == 'student') {
//                               print('llllllllllllllllllllllllllllllllllll');
//                               String lid = jasondata['lid'].toString();
//                               sh.setString("lid", lid);
//                               Navigator.push(context,
//                                   MaterialPageRoute(
//                                       builder: (context) => HomeScreen()));
//                             }
//                             else if (type == 'conductor') {
//                               String lid = jasondata['lid'].toString();
//                               sh.setString("lid", lid);
//
//                             }
//                             else{
//                               print("error");
//
//                             }
//                           }
//                           else{
//                             print("error");
//
//                           }
//
//                         },
//                         child: const Text("Login"),
//                       ),
//                     )
//                   ]),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:edumoodmonitoring/newhome.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Define dark blue theme colors
  final Color primaryDarkBlue = const Color(0xFF0A1930);
  final Color secondaryDarkBlue = const Color(0xFF1E3A5F);
  final Color accentBlue = const Color(0xFF3E78B2);
  final Color lightBlue = const Color(0xFF9BBDF9);
  final Color textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDarkBlue,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryDarkBlue,
        title: Text(
          "Login",
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [primaryDarkBlue, secondaryDarkBlue],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: secondaryDarkBlue.withOpacity(0.8),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Icon(
                          Icons.school,
                          size: 70,
                          color: lightBlue,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: usernameController,
                          style: TextStyle(color: textColor),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: secondaryDarkBlue.withOpacity(0.5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: accentBlue, width: 2),
                            ),
                            hintText: "Username",
                            hintStyle: TextStyle(color: textColor.withOpacity(0.6)),
                            prefixIcon: Icon(Icons.person, color: accentBlue),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          style: TextStyle(color: textColor),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: secondaryDarkBlue.withOpacity(0.5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: accentBlue, width: 2),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(color: textColor.withOpacity(0.6)),
                            prefixIcon: Icon(Icons.lock, color: accentBlue),
                          ),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () async {
                            final sh = await SharedPreferences.getInstance();
                            String Uname = usernameController.text.toString();
                            String Passwd = passwordController.text.toString();
                            String url = sh.getString("url").toString();
                            print("okkkkkkkkkkkkkkkkk");
                            var data = await http.post(
                                Uri.parse(url + "androidlogin_post"),
                                body: {
                                  'username': Uname,
                                  "password": Passwd,
                                });
                            var jasondata = json.decode(data.body);
                            String status = jasondata['status'].toString();
                            String type = jasondata['type'].toString();
                            if (status == "ok") {
                              if (type == 'student') {
                                print('llllllllllllllllllllllllllllllllllll');
                                String lid = jasondata['lid'].toString();
                                sh.setString("lid", lid);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              } else if (type == 'conductor') {
                                String lid = jasondata['lid'].toString();
                                sh.setString("lid", lid);
                              } else {
                                print("error");
                              }
                            } else {
                              print("error");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: accentBlue,
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 5,
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}