import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final _txt = TextEditingController();

  @override
  void dispose() {
    _txt.dispose();
    super.dispose();
  }

  String body = "";
  Future get() async {
    var url = Uri.parse('http://numbersapi.com/${_txt.text}');
    var response = await http.read(url);
    setState(() {
      body = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Numbers Game'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Numbers Trivia Game'),
            TextField(
              controller: _txt,
              decoration: const InputDecoration(
                hintText: 'Enter a number',
              ),
              onSubmitted: (value) {
                get();
              },
            ),
            ElevatedButton.icon(
                onPressed: () {
                  get();
                  print(_txt.text);
                },
                icon: Icon(Icons.abc_outlined),
                label: Text('here')),
            Text(body),
          ],
        ),
      ),
    );
  }
}
