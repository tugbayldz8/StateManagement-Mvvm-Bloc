
import 'package:flutter/material.dart';

class DenemePage extends StatefulWidget {
  const DenemePage({super.key});

  @override
  State<DenemePage> createState() => _DenemePageState();
}

class _DenemePageState extends State<DenemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Deneme Sayfası'),),
      body: Column(children: [
        Container(width: 50,height: 50,color: Colors.blue,),
        Container(width: 50,height: 50,color: Colors.yellow,),
      ]),
    );
  }
}