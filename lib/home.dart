import 'package:flutter/material.dart';


import 'Drawer.dart';


class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => homeState();
}


class homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("HOME"),
        ),
        drawer: const Drawerclass(),
        body: SafeArea(
            child:Container(decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/backg.png"),
                  fit: BoxFit.cover,)
            ),))
    );
  }
}

