// import 'dart:convert';
//
// import 'package:edumoodmonitoring/home.dart';
// import 'package:flutter/material.dart';
//
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class complaint extends StatefulWidget {
//   @override
//   _complaintState createState() => _complaintState();
// }
//
// class _complaintState extends State<complaint> {
// // Lists to store complaints and their replies
//   List<String> complaints = [];
//   List<String> replies = [];
//
//
//   List<String> ccid_ = <String>[];
//   List<String> date_ = <String>[];
//   List<String> reply_ = <String>[];
//
//   List<String> complaint_ = <String>[];
//   _complaintState(){
//     load();
//   }
//   Future<void> load() async {
//     List<String> ccid = <String>[];
//     List<String> date = <String>[];
//     List<String> reply = <String>[];
//     List<String> complaint = <String>[];
//
//
//     try {
//       final pref = await SharedPreferences.getInstance();
//       String lid = pref.getString("lid").toString();
//       String ip = pref.getString("url").toString();
//       // String lid= pref.getString("lid").toString();
//
//       String url = ip + "viewreply";
//       print(url);
//       var data = await http.post(Uri.parse(url), body: {
//         'lid': lid
//       });
//
//       var jsondata = json.decode(data.body);
//       String status = jsondata['status'];
//
//       var arr = jsondata["data"];
//
//       print(arr);
//
//       print(arr.length);
//
//       // List<String> schid_ = <String>[];
//       // List<String> date_ = <String>[];
//       // List<String> type_ = <String>[];
//
//       for (int i = 0; i < arr.length; i++) {
//         ccid.add(arr[i]['id'].toString());
//         date.add(arr[i]['date'].toString());
//         reply.add(arr[i]['reply'].toString());
//         complaint.add(arr[i]['complaint'].toString());
//       }
//       setState(() {
//         ccid_ = ccid;
//         date_ = date;
//         reply_ = reply;
//         complaint_ = complaint;
//       });
//       print(status);
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//       //there is error during converting file image to base64 encoding.
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Complaints"),
//       ),
//       body: ListView.builder(
//         physics: BouncingScrollPhysics(),
//         // padding: EdgeInsets.all(5.0),
//         // shrinkWrap: true,
//         itemCount: ccid_.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//               onTap: () {
//
//
//               },
//               title: Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Column(
//                   children: [
//
//
//                     Container(
//                       width: MediaQuery
//                           .of(context)
//                           .size
//                           .width,
//                       height: 200,
//                       child: Card(
//                         clipBehavior: Clip.antiAliasWithSaveLayer,
//                         child: Column(
//                           children: [
//
//                             SizedBox(height: 16,),
//                             Row(
//
//                               children: [
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//
//                                 Flexible(flex: 2,
//                                     fit: FlexFit.loose,
//                                     child: Row(children: [Text(" Date")])),
//                                 Flexible(flex: 3,
//                                     fit: FlexFit.loose,
//                                     child: Row(children: [Text(date_[index])])),
//
//                                 // Text("Place"),
//                                 // Text(place_[index])
//                               ],
//                             ),
//                             SizedBox(height: 16,),
//                             Row(
//
//                               children: [
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//
//                                 Flexible(flex: 2,
//                                     fit: FlexFit.loose,
//                                     child: Row(children: [Text("Complaint")])),
//                                 Flexible(flex: 3,
//                                     fit: FlexFit.loose,
//                                     child: Row(
//                                         children: [Text(complaint_[index])])),
//
//                                 // Text("Place"),
//                                 // Text(place_[index])
//                               ],
//                             ),
//                             SizedBox(height: 16,), Row(
//
//                               children: [
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//
//                                 Flexible(flex: 2,
//                                     fit: FlexFit.loose,
//                                     child: Row(children: [Text("Reply")])),
//                                 Flexible(flex: 3,
//                                     fit: FlexFit.loose,
//                                     child: Row(
//                                         children: [Text(reply_[index])])),
//
//                                 // Text("Place"),
//                                 // Text(place_[index])
//                               ],
//                             ),
//
//
//                           ],
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         elevation: 5,
//                         margin: EdgeInsets.all(10),
//                       ),
//                     ),
//
//
//                   ],
//                 ),
//               )
//
//
//           );
//         },
//
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
// // Navigate to the New Complaint page when the button is pressed
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => NewComplaintPage(),
//             ),
//           ).then((newComplaint) {
// // Add the new complaint to the list (if provided)
//             if (newComplaint != null) {
//               setState(() {
//                 complaints.add(newComplaint);
//                 replies.add("Admin Reply for New Complaint");
//               });
//             }
//           });
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class NewComplaintPage extends StatefulWidget {
//   @override
//   _NewComplaintPageState createState() => _NewComplaintPageState();
// }
//
// class _NewComplaintPageState extends State<NewComplaintPage> {
//   final TextEditingController _complaintController = TextEditingController();
//
//   @override
//   void dispose() {
//     _complaintController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Write a New Complaint"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _complaintController,
//               decoration: InputDecoration(
//                 hintText: "Enter your complaint...",
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 final sh = await SharedPreferences.getInstance();
//                 String complaint = _complaintController.text.toString();
//                 // String Passwd=passwordController.text.toString();
//                 String url = sh.getString("url").toString();
//                 String lid = sh.getString("lid").toString();
//                 print("okkkkkkkkkkkkkkkkk");
//                 var data = await http.post(
//                     Uri.parse(url + "complaintadd"),
//                     body: {'complaints': complaint,
//                       'lid': lid,
//
//                     });
//                 var jasondata = json.decode(data.body);
//                 String status = jasondata['task'].toString();
//                 if (status == "ok") {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => home()));
//                 }
//                 else {
//                   print("error");
//                 }
//               },
//               child: Text("Submit Complaint"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:convert';

import 'package:edumoodmonitoring/home.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// Define a consistent color theme
class AppTheme {
  static const Color primaryBlue = Color(0xFF1E88E5);
  static const Color darkBlue = Color(0xFF0D47A1);
  static const Color Blue = Color(0xFF64B5F6);
  static const Color accentBlue = Color(0xFF29B6F6);
  static const Color backgroundBlue = Color(0xFFE3F2FD);
  static const Color textDark = Color(0xFF263238);
}

class complaint extends StatefulWidget {
  @override
  _complaintState createState() => _complaintState();
}

class _complaintState extends State<complaint> {
  // Lists to store complaints and their replies
  List<String> complaints = [];
  List<String> replies = [];

  List<String> ccid_ = <String>[];
  List<String> date_ = <String>[];
  List<String> reply_ = <String>[];
  List<String> complaint_ = <String>[];

  _complaintState() {
    load();
  }

  Future<void> load() async {
    List<String> ccid = <String>[];
    List<String> date = <String>[];
    List<String> reply = <String>[];
    List<String> complaint = <String>[];

    try {
      final pref = await SharedPreferences.getInstance();
      String lid = pref.getString("lid").toString();
      String ip = pref.getString("url").toString();

      String url = ip + "viewreply";
      print(url);
      var data = await http.post(Uri.parse(url), body: {
        'lid': lid
      });

      var jsondata = json.decode(data.body);
      String status = jsondata['status'];

      var arr = jsondata["data"];

      print(arr);
      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        ccid.add(arr[i]['id'].toString());
        date.add(arr[i]['date'].toString());
        reply.add(arr[i]['reply'].toString());
        complaint.add(arr[i]['complaint'].toString());
      }

      setState(() {
        ccid_ = ccid;
        date_ = date;
        reply_ = reply;
        complaint_ = complaint;
      });

      print(status);
    } catch (e) {
      print("Error ------------------- " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.primaryBlue,
        title: Text(
          "Complaints",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: () => load(),
          ),
        ],
      ),
      backgroundColor: AppTheme.backgroundBlue,
      body: ccid_.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 80,
              color: AppTheme.Blue,
            ),
            SizedBox(height: 16),
            Text(
              "No complaints yet",
              style: TextStyle(
                fontSize: 18,
                color: AppTheme.textDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      )
          : ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: ccid_.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: BorderSide(
                  color: AppTheme.Blue.withOpacity(0.3),
                  width: 1,
                ),
              ),
              elevation: 4,
              shadowColor: AppTheme.darkBlue.withOpacity(0.3),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white,
                      AppTheme.backgroundBlue,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryBlue,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "Date: ${date_[index]}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionTitle("Complaint"),
                          _buildSectionContent(complaint_[index]),
                          SizedBox(height: 16),
                          _buildSectionTitle("Reply"),
                          _buildSectionContent(
                            reply_[index].isEmpty ? "No reply yet" : reply_[index],
                            color: reply_[index].isEmpty ? Colors.grey : AppTheme.textDark,
                            fontStyle: reply_[index].isEmpty ? FontStyle.italic : FontStyle.normal,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewComplaintPage(),
            ),
          ).then((newComplaint) {
            if (newComplaint != null) {
              setState(() {
                complaints.add(newComplaint);
                replies.add("Admin Reply for New Complaint");
                load(); // Refresh the data after adding a new complaint
              });
            }
          });
        },
        backgroundColor: AppTheme.accentBlue,
        child: Icon(Icons.add, color: Colors.white),
        elevation: 4,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          color: AppTheme.darkBlue,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildSectionContent(String content, {Color color = AppTheme.textDark, FontStyle fontStyle = FontStyle.normal}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppTheme.Blue.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        content,
        style: TextStyle(
          color: color,
          fontSize: 14,
          fontStyle: fontStyle,
        ),
      ),
    );
  }
}

class NewComplaintPage extends StatefulWidget {
  @override
  _NewComplaintPageState createState() => _NewComplaintPageState();
}

class _NewComplaintPageState extends State<NewComplaintPage> {
  final TextEditingController _complaintController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _complaintController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryBlue,
        elevation: 0,
        title: Text(
          "Write a New Complaint",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: AppTheme.backgroundBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text(
                  "What's your concern?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkBlue,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Please provide details about your complaint so we can address it effectively.",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.textDark.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.Blue.withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: _complaintController,
                      decoration: InputDecoration(
                        hintText: "Enter your complaint here...",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      maxLines: 7,
                    ),
                  ),
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isSubmitting
                        ? null
                        : () async {
                      if (_complaintController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter a complaint'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      setState(() {
                        _isSubmitting = true;
                      });

                      try {
                        final sh = await SharedPreferences.getInstance();
                        String complaint = _complaintController.text.toString();
                        String url = sh.getString("url").toString();
                        String lid = sh.getString("lid").toString();

                        var data = await http.post(
                          Uri.parse(url + "complaintadd"),
                          body: {
                            'complaints': complaint,
                            'lid': lid,
                          },
                        );

                        var jsondata = json.decode(data.body);
                        String status = jsondata['task'].toString();

                        if (status == "ok") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Complaint submitted successfully'),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => home()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Complaint registered'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error: $e'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } finally {
                        setState(() {
                          _isSubmitting = false;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppTheme.accentBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      shadowColor: AppTheme.accentBlue.withOpacity(0.4),
                    ),
                    child: _isSubmitting
                        ? SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                        : Text(
                      "Submit Complaint",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}