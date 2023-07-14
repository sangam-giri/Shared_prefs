import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/view/screens/home.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _inputController = TextEditingController();

  void storeData(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("USER_DATA", data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _inputController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                storeData(_inputController.text);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const HomeScreen();
                }));
              },
              child: const Text("Navigate"))
        ],
      )),
    );
  }
}
