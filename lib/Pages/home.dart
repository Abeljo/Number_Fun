import 'dart:math';
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

  String trivia = "";
  String maths = "";
  String years = "";

  Future get() async {
    var url = Uri.parse('http://numbersapi.com/${_txt.text}');
    var url2 = Uri.parse('http://numbersapi.com/${_txt.text}/math');
    var url3 = Uri.parse('http://numbersapi.com/${_txt.text}/year');
    var response = await http.read(url);
    var response2 = await http.read(url2);
    var response3 = await http.read(url3);
    setState(() {
      trivia = response;
      maths = response2;
      years = response3;
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
            _txt.text.isEmpty
                ? Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    margin: const EdgeInsets.only(top: 30),
                    color: Colors.white24,
                    height: 170,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Welcome to Numbers Game 🔢.',
                          style: TextStyle(fontSize: 33),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Take a number and get a fact about it 😊',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ))
                : Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Given Number: ${_txt.text}',
                            style: const TextStyle(
                                backgroundColor: Colors.blue,
                                color: Colors.white,
                                fontSize: 26),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Trivia Facts',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                          Container(
                            //alignment: Alignment.center,
                            margin: const EdgeInsets.only(left: 15),
                            child: Text(
                              trivia,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w300),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Math Facts',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            //alignment: Alignment.center,
                            margin: const EdgeInsets.only(left: 15),
                            child: Text(
                              maths,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w300),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Year Facts',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            //alignment: Alignment.center,
                            margin: const EdgeInsets.only(left: 15),
                            child: Text(
                              years,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            Container(
              margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _txt,
                decoration: const InputDecoration(
                    hintText: 'Enter a number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                onSubmitted: (value) {
                  get();
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                          onPressed: () {
                            _txt.text = Random().nextInt(100).toString();
                            get();
                          },
                          icon: const Icon(Icons.numbers),
                          label: const Text('Random Facts')),
                      ElevatedButton.icon(
                          onPressed: () {
                            get();
                          },
                          icon: const Icon(Icons.search_sharp),
                          label: const Text('Search Facts')),
                    ],
                  ),
                  _txt.text.isEmpty
                      ? const Text('')
                      : Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  _txt.clear();
                                });
                              },
                              icon: const Icon(Icons.clear),
                              label: const Text('clear')),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
