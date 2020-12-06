import 'package:flutter/material.dart';
import 'api.dart' as api;
import 'const.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() => runApp(SberCourse());

class SberCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _MyHomePage());
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  var _value;

  refresh() async {
    setState(() {
      getBuyValuePrev();
    });
  }

  getBuyValuePrev() async {
    api.getBuyValue().then((value) => _value = value);
  }

  @override
  void initState() {
    super.initState();
    this.getBuyValuePrev();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Contst.primaryColor, Contst.secondaryColor],
              )),
              alignment: Alignment.center,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(
                  Icons.arrow_drop_up,
                  color: Colors.white,
                  size: 60,
                ),
                Text(_value ?? "00,00",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                    )),
              ]),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
            child: Text(
              "History",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17,
              ),
            ),
          ),
          Flexible(
              flex: 2,
              child: Container(
                child: ListView(
                  children: api.card,
                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed:refresh,
        child: IconButton(
          icon: Icon(
            Icons.refresh_rounded,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
