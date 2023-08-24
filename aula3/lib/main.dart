import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      alignment: Alignment.center,
      //  transform: Matrix4.rotationZ(0.1),
      color: Colors.blueAccent,
      width: 320.0,
      height: 320.0 ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        textDirection: TextDirection.ltr,
        children: [
          Text("slo", textDirection: TextDirection.ltr,),
         // Icon(Icons.accessibility_outlined, color: Colors.lightGreenAccent,),
         // Icon(Icons.icecream_rounded, color: Colors.red,)
        ],
      ),
    );

  }

}
