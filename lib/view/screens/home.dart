import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String value = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString("USER_DATA");
    print("Data: " + data.toString());
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        value = data!;
      });
    });
  }

  clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value.toString()),
          ElevatedButton(onPressed: () {}, child: const Text("Clear Data"))
        ],
      )),
    );
  }
}
