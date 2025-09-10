import 'package:flutter/material.dart';
void main(){
  runApp(const WelcomePage());
}
class WelcomePage extends StatelessWidget{
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("This is about Navigating to other page"),
        backgroundColor: const Color.fromARGB(255, 189, 118, 142),),
        body: Center(child:Text('Hi Welcome!',style: TextStyle(fontSize: 24),)),
      ),
    );
  }
}