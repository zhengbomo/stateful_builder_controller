import 'package:flutter/material.dart';
import 'package:stateful_builder_controller/stateful_builder_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final countSetterController = SetterController();

  int _counter = 0;

  void _incrementCounter() {
    // update count locally
    countSetterController.update(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:2',
            ),
            StatefulBuilder3<Widget, Widget, Widget>(
              builder: (context, setter, value1, value2, value3) {
                print("value");
                // when call countSetterController.update, only reload here
                return Column(
                  children: [
                    value1,
                    value2,
                    Text(
                      '$_counter',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline4,
                    ),
                  ],
                );
              },
              controller: countSetterController,
              value1: Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
              value2: Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}