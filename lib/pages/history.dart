import 'dart:html';

import 'package:flutter/material.dart';
import 'hasil.dart';
import '../main.dart';

class PageHistory extends StatefulWidget {
  final List<String> datah;
  const PageHistory({Key? key, required this.datah}) : super(key: key);

  @override
  State<PageHistory> createState() => _PageHistoryState();
}

class _PageHistoryState extends State<PageHistory> {

  TextEditingController controllerx = new TextEditingController();

  void update(String query){
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      home: Scaffold(
        appBar: AppBar(
          title: Text("History"),
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back"),
              ),
              SizedBox(
                height: 8,
              ),
              Text("Notes: Filter for greater value than user input"),
              SizedBox(
                height: 8,
              ),
              TextField(
                onChanged: update,
                controller: controllerx,
                decoration: InputDecoration(
                  hintText: "Input number here",
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.datah.length,
                  itemBuilder: (context, index) {
                    if(controllerx.text.isEmpty) {
                      return Dismissible(
                        key: Key(widget.datah[index]),
                        background: Container(
                          padding: EdgeInsets.only(left: 8),
                          alignment: Alignment.centerLeft,
                          color: Colors.green,
                          child: Icon(Icons.check),
                        ),
                        secondaryBackground: Container(
                          padding: EdgeInsets.only(right: 8),
                          alignment: Alignment.centerRight,
                          color: Colors.red,
                          child: Icon(Icons.cancel),
                        ),
                        confirmDismiss: (direction) async {
                          if (direction == DismissDirection.endToStart) {
                            return false;
                          } else {
                            return true;
                          }
                        },
                        onDismissed: (direction) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${widget.datah[index]} dismissed'),
                            ),
                          );
                          setState(() {
                            widget.datah.removeAt(index);
                          });
                        },
                        child: ListTile(
                          title: Text(widget.datah[index]),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(widget.datah[index]),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    else {
                      int a = int.parse(widget.datah[index]);
                      int b = int.parse(controllerx.text);

                      if(a > b) {
                        return Dismissible(
                        key: Key(widget.datah[index]),
                        background: Container(
                          padding: EdgeInsets.only(left: 8),
                          alignment: Alignment.centerLeft,
                          color: Colors.green,
                          child: Icon(Icons.check),
                        ),
                        secondaryBackground: Container(
                          padding: EdgeInsets.only(right: 8),
                          alignment: Alignment.centerRight,
                          color: Colors.red,
                          child: Icon(Icons.cancel),
                        ),
                        confirmDismiss: (direction) async {
                          if (direction == DismissDirection.endToStart) {
                            return false;
                          } else {
                            return true;
                          }
                        },
                        onDismissed: (direction) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${widget.datah[index]} dismissed'),
                            ),
                          );
                          setState(() {
                            widget.datah.removeAt(index);
                          });
                        },
                        child: ListTile(
                          title: Text(widget.datah[index]),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(widget.datah[index]),
                              ),
                            );
                          },
                        ),
                      );
                      } else {
                        return Container();
                      }
                    }
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
