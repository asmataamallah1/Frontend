import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'login_page.dart';




import '/dashboard/drawer.dart';




class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6A8E78),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/image1.png'),
          Text(
            "welcome",
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
              letterSpacing: 2.0,
              fontFamily: 'Palanquin',
            ),
          ),
          Container(
            margin:  EdgeInsets.fromLTRB(10, 60, 20, 10),
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const LoginPage())),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                primary: Color(0xFF6A8E80),
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily:'Palanquin',
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(200))),
              ),
              child: Text('Get started'),
            ),
          ),

        ],
      ),

    );
  }
}


/*onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) =>  todays_report())),

 */