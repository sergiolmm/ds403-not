import 'package:flutter/material.dart';

void main() {
  runApp( MeuWidget());
}

const TextStyle t1 = TextStyle(color: Colors.red, fontSize: 30.0);


class MeuWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Center(
    child: Container(
     //constraints: BoxConstraints.expand(height: 50),
     padding: const EdgeInsets.all(2.0),
     alignment: Alignment.center,
     //  transform: Matrix4.rotationZ(0.1),
     color: Colors.blueAccent,
     width: 320.0,
     height: 320.0 ,
     child: const Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       textDirection: TextDirection.ltr,
       children: [
             Text(
               "Alo turma",
               textDirection: TextDirection.ltr,
               style: t1,
             ),
             Text(
               "Alo turma",
               textDirection: TextDirection.ltr,
               style: t1,
             ),
       ],
       )
     ),
   );
  }


  /*
     child: const Column(
       children: [
         Text("data",
             textDirection: TextDirection.ltr,
             style: TextStyle(
               fontSize: 25.0
             ),
         ),
         Text("Linha2",
           textDirection: TextDirection.ltr,
           style: t1,
         )
         
       ],
     ),*/

  }

