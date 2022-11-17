import 'package:flutter/material.dart';

// simplest example
/*
void main() {
  return runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Hello World")),
      )
    )
  );
}
*/

void main() {
  return runApp(MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text("Hello World")),
          body: Column (
            mainAxisAlignment: MainAxisAlignment.start,  // top to bottom
            crossAxisAlignment: CrossAxisAlignment.stretch, //left - right
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.red),
                child: Text("One"),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.green),
                child: Text("Two"),
              ),
               Container(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text("Three"),
              )
          ])
          )));
}
