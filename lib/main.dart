import 'package:flutter/material.dart';
int? count;

void main() {
  count = 0;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(key: UniqueKey()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class  HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

bool get isFree => count! > 0;
bool get isFull => count! >= 15;


class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {



    void decrement() {
      int contador = count!;
      if(isFree) {
        setState(() {
          count = contador - 1;
        });
      }
      print('decrement $count');

    }

    void increment() {
      int contador = count!;

      if(contador < 15) {
        setState(() {
          count = contador + 1;
        });
      }
      print('increment $count');
    }



    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sorvete.png'),
              fit: BoxFit.cover,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              !isFull && count != null ? 'Pode Entrar' : 'Lotado !!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: isFull ? Colors.red : Colors.white,
              ),
            ),
            Padding(
                padding: EdgeInsets.all(80),
                child: Text(
                  '$count',
                  style: TextStyle(
                      fontSize: 80,
                      color: isFull ? Colors.red : Colors.white),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isFree ?  decrement : null,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.orange,
                    fixedSize: const Size(150, 100),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  child: Text('Saiu',
                      style: TextStyle(color: Colors.white, fontSize: 35)),
                ),
                const SizedBox(width: 40),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(backgroundColor: Colors.orange,
                    fixedSize: const Size(150, 100),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  child: const Text(
                    'Entrou',
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}