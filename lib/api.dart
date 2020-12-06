
import 'package:flutter/material.dart';
import 'package:sberUSD/rates.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'const.dart';

Future<String> getBuyValue() async {
  var url = Contst.getCourseUSD;
  var response = await http.get(url);
  var buyValue;
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    buyValue = jsonResponse['nal']['840']['0']['buyValue'];
    print('Курс Бакса : $buyValue');
  } else
    print("Error ${response.statusCode}");
  return"$buyValue";
}

Future <List> getBuyValueAll() async {
  var url = Contst.getAllUSD;
  List rates;
  var response = await http.post(
    url,
    headers: {
      "content-type": "application/json",
    },
    body: "{\"currencyData\":[{\"currencyCode\":\"840\",\"rangesAmountFrom\":[1000]}],\"categoryCode\":\"nal\"}",
  );
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var itemCount = jsonResponse['840'];
    rates = itemsberCount['rates'];
  } else
    print("Error ${response.statusCode}");
  return rates;
}

Future <List <Rates>> getRates() async {
  List all = await getBuyValueAll();
  List<Rates> parseRates = List<Rates>();
  all.forEach((element) {
    parseRates.add(
        new Rates(
            element["buyValue"],
            element["sellValue"],
            element["activeFrom"],
            element["rangeId"],
            element["rangeFrom"],
            element["rangeTo"]));
  });
  return parseRates;
}

List<Widget> card = [
  Padding(
    padding: const EdgeInsets.fromLTRB(30.0, 0, 30, 0),
    child: TimelineTile(
      isFirst: true,
      indicatorStyle: const IndicatorStyle(
        width: 7,
        color: Colors.red,
        padding: EdgeInsets.all(5),
      ),
      beforeLineStyle: const LineStyle(
        color: Colors.grey,
        thickness: 1,
      ),
      endChild: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "100,33",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text("20.11.2020	",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          "10:04",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.fromLTRB(30.0, 0, 30, 0),
    child: TimelineTile(
      isFirst: false,
      indicatorStyle: const IndicatorStyle(
        width: 7,
        color: Colors.red,
        padding: EdgeInsets.all(5),
      ),
      beforeLineStyle: const LineStyle(
        color: Colors.grey,
        thickness: 1,
      ),
      endChild: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "100,33",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text("20.11.2020	",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          "10:04",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.fromLTRB(30.0, 0, 30, 0),
    child: TimelineTile(
      isFirst: false,
      indicatorStyle: const IndicatorStyle(
        width: 7,
        color: Colors.green,
        padding: EdgeInsets.all(5),
      ),
      beforeLineStyle: const LineStyle(
        color: Colors.grey,
        thickness: 1,
      ),
      endChild: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "100,33",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text("20.11.2020	",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          "10:04",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.fromLTRB(30.0, 0, 30, 0),
    child: TimelineTile(
      isFirst: false,
      indicatorStyle: const IndicatorStyle(
        width: 7,
        color: Colors.red,
        padding: EdgeInsets.all(5),
      ),
      beforeLineStyle: const LineStyle(
        color: Colors.grey,
        thickness: 1,
      ),
      endChild: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "100,33",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text("20.11.2020	",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          "10:04",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.fromLTRB(30.0, 0, 30, 0),
    child: TimelineTile(
      isFirst: false,
      indicatorStyle: const IndicatorStyle(
        width: 7,
        color: Colors.red,
        padding: EdgeInsets.all(5),
      ),
      beforeLineStyle: const LineStyle(
        color: Colors.grey,
        thickness: 1,
      ),
      endChild: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "100,33",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text("20.11.2020	",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          "10:04",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  ),
];
