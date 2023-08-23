import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        children: [
          Icon(Icons.ac_unit, color: Colors.deepOrange),
          Icon(Icons.accessibility_outlined, color: Colors.lightGreenAccent,),
          Icon(Icons.icecream_rounded, color: Colors.red,)
        ],
      ),
    );
  }

}
