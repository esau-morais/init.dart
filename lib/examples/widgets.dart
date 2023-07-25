import 'package:flutter/material.dart';

import 'inherited.dart';

class MyWidgets extends StatelessWidget {
  const MyWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Container(
            color: Colors.black,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Stateless'),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(color: Colors.red, width: 100, height: 100),
                        Container(
                            color: Colors.orange, width: 100, height: 100),
                        Container(color: Colors.yellow, width: 100, height: 100)
                      ]),
                  Row(children: [
                    Container(color: Colors.green, width: 100, height: 100),
                    Container(
                        color: Colors.lightBlueAccent, width: 100, height: 100),
                    Container(color: Colors.blueAccent, width: 100, height: 100)
                  ]),
                  Row(children: [
                    Container(color: Colors.purple, width: 100, height: 100),
                    Container(color: Colors.pink, width: 100, height: 100),
                    Container(color: Colors.white, width: 100, height: 100)
                  ]),
                  const Text('Inherited'),
                  FrogColor(
                    color: Colors.green,
                    child: Builder(
                      builder: (BuildContext innerContext) {
                        return Text(
                          'Hello Frog',
                          style: TextStyle(
                              color: FrogColor.of(innerContext).color),
                        );
                      },
                    ),
                  ),
                ])));
  }
}
