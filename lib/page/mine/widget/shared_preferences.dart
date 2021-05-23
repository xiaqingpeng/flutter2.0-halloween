import 'package:flutter/material.dart';

class SharedPreferences extends StatefulWidget {
 

  @override
  _SharedPreferencesState createState() => _SharedPreferencesState();
}

class _SharedPreferencesState extends State<SharedPreferences> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('状态存储'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('状态存储'),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
