// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // import 'login.dart';
// //
// //
// //
// //
// // class ipset extends StatefulWidget {
// //   const ipset({super.key});
// //
// //   @override
// //   State<ipset> createState() => _ipsetstate();
// // }
// //
// // class _ipsetstate extends State<ipset> {
// //   final TextEditingController ipController = TextEditingController();
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         title: const Text("edumood monitoring"),
// //       ),
// //       body: SafeArea(
// //         child: Center(
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               Padding(
// //                 padding: const EdgeInsets.all(2),
// //                 child: TextField(
// //
// //                   controller: ipController,
// //                   decoration: const InputDecoration(
// //                       border: OutlineInputBorder(),
// //                       labelText: "IP Address",
// //                       hintText: "Enter a valid ip address"),
// //
// //
// //                 ),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.all(16.0),
// //                 child: ElevatedButton(
// //                   onPressed: () async{
// //
// //                     String ip=ipController.text.toString();
// //                     final sh = await SharedPreferences.getInstance();
// //                     sh.setString("url", "http://"+ip+":8000/");
// //                     Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
// //                   },
// //                   child: const Icon(Icons.key),
// //
// //                   style: ButtonStyle(
// //                     backgroundColor: MaterialStateProperty.all<Color>(
// //                       Colors.amber, // Use a proper color value (e.g., Hex or RGB)
// //                     ),
// //                   ),
// //                 ),
// //               )
// //
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'login.dart';
//
// class ipset extends StatefulWidget {
//   const ipset({super.key});
//
//   @override
//   State<ipset> createState() => _ipsetstate();
// }
//
// class _ipsetstate extends State<ipset> {
//   final TextEditingController ipController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     // Define a blue theme palette
//     const Color primaryBlue = Color(0xFF2196F3);
//     const Color darkBlue = Color(0xFF1565C0);
//     const Color lightBlue = Color(0xFFBBDEFB);
//     const Color textColor = Color(0xFF0D47A1);
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.lightBlue,
//         title: const Text(
//           "Edu-Mood Monitoring",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1.2,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.white, lightBlue],
//           ),
//         ),
//         child: SafeArea(
//           child: Center(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(24.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     // Logo or icon placeholder
//                     Icon(
//                       Icons.computer_rounded,
//                       size: 80,
//                       color: darkBlue,
//                     ),
//                     const SizedBox(height: 20),
//                     const Text(
//                       "Configure Server Address",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: textColor,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     const Text(
//                       "Enter the IP address of your Edu-Mood server",
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.blueGrey,
//                       ),
//                     ),
//                     const SizedBox(height: 30),
//                     // IP Input field
//                     TextField(
//                       controller: ipController,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         prefixIcon: const Icon(Icons.wifi, color: darkBlue),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide: BorderSide.none,
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide: BorderSide(color: lightBlue, width: 2),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide: BorderSide(color: primaryBlue, width: 2),
//                         ),
//                         labelText: "IP Address",
//                         labelStyle: TextStyle(color: Colors.blueGrey[700]),
//                         hintText: "Enter a valid IP address",
//                         hintStyle: TextStyle(color: Colors.blueGrey[400]),
//                         contentPadding: const EdgeInsets.symmetric(vertical: 16),
//                       ),
//                       keyboardType: TextInputType.number,
//                       style: const TextStyle(fontWeight: FontWeight.w500),
//                     ),
//                     const SizedBox(height: 30),
//                     // Connect button
//                     SizedBox(
//                       width: double.infinity,
//                       height: 50,
//                       child: ElevatedButton(
//                         onPressed: () async {
//                           String ip = ipController.text.toString();
//                           final sh = await SharedPreferences.getInstance();
//                           sh.setString("url", "http://" + ip + ":8000/");
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
//                         },
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all<Color>(primaryBlue),
//                           foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//                           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                           elevation: MaterialStateProperty.all(0),
//                         ),
//                         child: const Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               "CONNECT",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: 1.2,
//                               ),
//                             ),
//                             SizedBox(width: 8),
//                             Icon(Icons.arrow_forward),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class ipset extends StatefulWidget {
  const ipset({super.key});

  @override
  State<ipset> createState() => _ipsetstate();
}

class _ipsetstate extends State<ipset> {
  final TextEditingController ipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Define a blue theme palette
    const Color primaryBlue = Color(0xFF2196F3);
    const Color darkBlue = Color(0xFF1565C0);
    const Color lightBlue = Color(0xFFBBDEFB);
    const Color textColor = Color(0xFF0D47A1);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          "Edu-Mood Monitoring",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, lightBlue],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Animated logo or icon
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: darkBlue.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.computer_rounded,
                        size: 60,
                        color: darkBlue,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Configure Server Address",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Enter the IP address of your Edu-Mood server",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // IP Input field with shadow
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: darkBlue.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: ipController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(Icons.wifi, color: darkBlue),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: lightBlue, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: primaryBlue, width: 2),
                          ),
                          labelText: "IP Address",
                          labelStyle: TextStyle(color: Colors.blueGrey[700]),
                          hintText: "Enter a valid IP address",
                          hintStyle: TextStyle(color: Colors.blueGrey[400]),
                          contentPadding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        keyboardType: TextInputType.number,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Animated Connect button
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: primaryBlue.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          String ip = ipController.text.toString();
                          final sh = await SharedPreferences.getInstance();
                          sh.setString("url", "http://" + ip + ":8000/");
                          Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(primaryBlue),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          elevation: MaterialStateProperty.all(0),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "CONNECT",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}