// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'first_page.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: home(),
  ));
}
































class screenverificationcode extends StatefulWidget {
  const screenverificationcode({Key? key}) : super(key: key);
  @override
  State<screenverificationcode> createState() => _screenverificationcode();
}
class _screenverificationcode extends State<screenverificationcode> {
  TextEditingController textEditingController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6A8E78),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Home page '),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'entry 6 digits code:',
          ),

        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.verified),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 8),
            foregroundColor: Colors.black54,
            primary: Color(0xFFD9D9D9),
            textStyle:  TextStyle(
              fontSize: 25,
              fontFamily:'Palanquin',
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          label: Text('Validate'),
        ),
      ),

    );
  }
}









