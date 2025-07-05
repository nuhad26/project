import 'package:edumoodmonitoring/complaint.dart';
import 'package:edumoodmonitoring/profile.dart';
import 'package:edumoodmonitoring/view_internalmark.dart';
import 'package:edumoodmonitoring/view_staff.dart';
import 'package:edumoodmonitoring/view_studymaterial.dart';
import 'package:edumoodmonitoring/view_subject.dart';
import 'package:edumoodmonitoring/view_time_table.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

class Drawerclass extends StatelessWidget {
  const Drawerclass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Text(
              "My App",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                // Handle icon button press
              },
              icon: const Icon(Icons.home),
            ),
            title: const Text("Home"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const home()));
            },
          ),
          ListTile(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.directions_bus)),
            title: const Text("VIEW PROFILE"),
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => StudentProfilePage()));
            },
          ),
          ListTile(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.bus_alert)),
            title: const Text("VIEW TIMETABLE"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TimeTable()));
            },
          ),
          ListTile(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.feedback)),
            title: const Text("SEND FEEDBACK"),
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => feedback()));
            },
          ),
          ListTile(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.feedback)),
            title: const Text("VIEW STUDY MATERIAL"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => view_studymaterial()));
            },
          ),
          ListTile(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.feedback)),
            title: const Text("VIEW INTERNAL MARK"),
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => view_internalmark()));
            },
          ),
          ListTile(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.feedback)),
            title: const Text("VIEW SUBJECTS"),
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => view_subject()));
            },
          ),
          ListTile(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.feedback)),
            title: const Text("ATTENDANCE"),
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => feedback()));
            },
          ),
          ListTile(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.feedback)),
            title: const Text("INTERACT WITH TEACHERS"),
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => StaffList()));
            },
          ),
          ListTile(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.feedback)),
            title: const Text("SEND COMPLAINTS & VIEW REPLY"),
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => complaint()));
            },
          ),
        ],
      ),
    );
  }
}
