import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage()
    );
  }

}

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
     color:Colors.black,
     alignment: Alignment.center,
     child: const  Text('Olá mundo !'),

   );
  }


}