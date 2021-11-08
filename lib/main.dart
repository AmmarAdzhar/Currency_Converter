// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:currency_converter/Service/api_client.dart';
import 'package:currency_converter/Widget/drop_down.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// ignore: duplicate_ignore, duplicate_ignore
class _HomePageState extends State<HomePage> {
  ApiClient client = ApiClient();
  // ignore: prefer_const_constructors
  Color mainColor = Color(0xFF4A148C);
  // ignore: prefer_const_constructors
  Color seccondColor = Color(0xFF6200EA);

  late List<String> currencies;
  late String from;
  late String to;

  late double rate;
  String result = "";

  Future<List<String>> getCurrencyList() async {
    return await client.getCurrencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    (() async {
      List<String> list = await getCurrencyList();
      setState(() {
        currencies = getCurrencyList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                  width: 200.0,
                  // ignore: prefer_const_constructors
                  child: Text("Currency Converter",
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ))),
              // ignore: prefer_const_constructors
              Expanded(
                  // ignore: prefer_const_constructors
                  child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Enter tffhe value",
                          labelStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                            color: seccondColor,
                          )),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        customDropDown(currencies, from, (from) {}),
                      ],
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
