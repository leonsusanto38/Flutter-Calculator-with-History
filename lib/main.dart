import 'pages/hasil.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<String> HistoryList = [];

  String isi = "";

  @override
  Widget build(BuildContext context) {
    Widget display = Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.only(right: 16),
      height: 48,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(isi),
        ],
      ),
    );

    Container buttonRow(String row1, String row2, String row3, String row4) {
      return Container(
        margin: EdgeInsets.only(top: 4),
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 48,
              width: 120,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  if (row1 == "C") {
                    setState(() {
                      isi = "";
                    });
                  } else {
                    setState(() {
                      isi += row1;
                    });
                  }
                },
                child: Text(row1),
              ),
            ),
            Container(
              height: 48,
              width: 120,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    isi += row2;
                  });
                },
                child: Text(row2),
              ),
            ),
            Container(
              height: 48,
              width: 120,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    isi += row3;
                  });
                },
                child: Text(row3),
              ),
            ),
            Container(
              height: 48,
              width: 120,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  if (row4 == "=") {
                    Parser p = Parser();
                    Expression exp = p.parse(isi);
                    ContextModel cm = ContextModel();
                    double x = exp.evaluate(EvaluationType.REAL, cm);
                    isi = x.toString();

                    setState(() {
                      HistoryList.insert(0, isi);
                    });
                    
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Hasil(datax: isi, datah: HistoryList,);
                    }),);

                  } else {
                    setState(() {
                      isi += row4;
                    });
                  }
                },
                child: Text(row4),
              ),
            ),
          ],
        ),
      );
    }

    Widget calculatorButton = Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(children: [
        buttonRow("C", "^", "*", "/"),
        buttonRow("7", "8", "9", "-"),
        buttonRow("4", "5", "6", "+"),
        buttonRow("1", "2", "3", "="),
        buttonRow("", "0", "", ""),
      ]),
    );

    return MaterialApp(
      title: "Calculator",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Container(
          color: Color.fromARGB(255, 200, 200, 200),
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              display,
              calculatorButton,
            ],
          ),
        ),
      ),
    );
  }
}
