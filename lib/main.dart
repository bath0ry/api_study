import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dio = Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));
  int _counter = 0;
  List<dynamic> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: ((_, index) => ListTile(
                title: Text(todos[index]["title"]),
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await dio.get("/todos");
          todos = response.data;
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.menu),
      ),
    );
  }
}
