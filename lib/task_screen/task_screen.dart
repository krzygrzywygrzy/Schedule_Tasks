import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(),
      ),
    );
  }



  Widget loading() {
    return Center(
      child: Container(
        child: Text("Please wait, your data is loading..."),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
