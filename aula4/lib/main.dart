import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aula 4",
      home: MinhaPagina(),
      theme:  ThemeData(
        primarySwatch: Colors.lime
      ),
    );
  }
}

class MinhaPagina extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MinhaPaginaState();
}

class _MinhaPaginaState extends State<MinhaPagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aula 4 icones"),
      ),
      body:
       Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [

          Center(
           child: Icon(Icons.accessibility_outlined,
             size: 80,
             color: Colors.lightBlue,),
          )
        ],
      ),
    );
  }

}


