import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// ignore_for_file: prefer_const_constructors

class WeightEntry extends StatelessWidget {
  final _controller = TextEditingController();
  void _saveTask() {
    final Weightvalue = _controller.text;
    DateTime now = DateTime.now();
    FirebaseFirestore.instance
        .collection("weights")
        .add({"weight": Weightvalue, "time": now});
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(height: 100),
            Material(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Enter Weight',
                    hintText: 'Enter Your Weight'),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                _saveTask();
              },
              child: Text(
                'Save Entry',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
                child: const Text('ViewEntries'),
                onPressed: () {
                  // adding some properties
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.yellow,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      builder: (BuildContext context) {
                        // UDE : SizedBox instead of Container for whitespaces
                        return SizedBox(
                          height: 400,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text('Most recent weight Entries'),
                              ],
                            ),
                          ),
                        );
                      });
                })
          ],
        ),
      ),
    );
  }
}
