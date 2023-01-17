import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_1/dashboard/drawer.dart';
import 'package:test_1/service/login_service.dart';
import 'api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int activeIndex = 0;
  late String? _username;
  late String? _password;
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        activeIndex++;

        if (activeIndex == 4)
          activeIndex = 0;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LoginService network = LoginService();

    return Scaffold(
        backgroundColor: Color(0xFF6A8E78),
        body: Form(
            key: _keyForm,
            child: ListView(
                children: [
                  Image.asset("assets/image1.png"),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Username"),
                      onSaved: (String? value) {
                        _username = value;
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Le username ne doit pas etre vide";
                        }
                        else if (value.length < 5) {
                          return "Le username doit avoir au moins 5 caractères";
                        }
                        else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Mot de passe"),
                        onSaved: (String? value) {
                          _password = value;
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Le mot de passe ne doit pas etre vide";
                          }

                          else {
                            return null;
                          }
                        }
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: ElevatedButton(
                        child: const Text("S'authentifier"),
                        onPressed: () async{
                          if (_keyForm.currentState!.validate()) {
                            _keyForm.currentState!.save();
                            Map<String, dynamic> userData = {
                              "email": _username,
                              "password": _password
                            };
                            print("before req");
                            network.login(_username.toString(),_password.toString() ).then(
                              (value) {
                                if (value == true) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => todays_report()));
                                }
                                },
                            );
                          }
                          else {
                            showDialog(context: context, builder: (context) {
                              return const AlertDialog(
                                title: Text("Information"),
                                content: Text(
                                    "Une erreur est survenu, veuillez réessayer une autre fois"),);
                            }
                            );
                          }
                        }
                    ),
                  ),
                ]
            )
        )
    );
  }


}