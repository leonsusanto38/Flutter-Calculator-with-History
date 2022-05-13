import 'package:flutter/material.dart';
import 'history.dart';

class Hasil extends StatefulWidget {
  final String datax;
  final List<String> datah;
  const Hasil({Key? key, required this.datax, required this.datah}) : super(key: key);

  @override
  State<Hasil> createState() => _HasilState();
}

class _HasilState extends State<Hasil> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hasil"),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(0, 8, 0, 16),
                  child: Text(
                    widget.datax,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back"),
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return PageHistory(datah: widget.datah);
                    }),
                  );
                },
                child: Text("History"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
