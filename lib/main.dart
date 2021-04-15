import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _color = Colors.blue;
  String _txt = 'Par';

  void _incrementCounter() {
    setState(() {
      _counter++;
      parOuImpar(_counter);
    });
  }

  void parOuImpar(int counter) {
    if (counter % 2 == 0) {
      _color = Colors.blue;
      _txt = 'Par';
    } else {
      _color = Colors.red;
      _txt = 'Ímpar';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APP'),
      ),
      body: Container(
        color: _color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // buildDropdownButton(),
              Text(
                'Aperte o botão para incrementar o número e mudar de cor!',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '$_counter',
                style: TextStyle(fontSize: 50),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '$_txt',
                style: TextStyle(fontSize: 40),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _color,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
