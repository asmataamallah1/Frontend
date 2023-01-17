import 'package:flutter/material.dart';

import '../api.dart';
import '../service/dashboard_service.dart';
import 'charts/luminosity.dart';
import 'charts/soilmoisture.dart';
import 'charts/thermalimages.dart';
import 'charts/weatherparameters.dart';







class DashboardPage extends StatefulWidget {


  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override

  String temperature_value = "28.3"+ "°C";
  String pressure_value = "51.5"+" "+"hPa";
  String moisture_value = "1018.4"+" "+"g/m3";



  String dropdownvalue ='END-NODE1';
  var items=['END-NODE1','END-NODE2','END-NODE3','END-NODE4'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 20,right: 20,bottom:0),
              child: DropdownButtonFormField(
                value: dropdownvalue,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                items: items.map(
                        (String items){
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }
                        ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue=newValue!;
                  });
                },
                icon:  const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.black,
                ),
                iconSize: 25.0,
                dropdownColor: Colors.white,
                decoration: const InputDecoration(
                  labelText: "END-NODE",

                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),),
                  ),
                ),
              ),



            Stack(
                children: [
                  Center(
                    child:
                    Container (
                      margin:  EdgeInsets.only(top: 35,left: 15,right: 15,bottom: 0),
                      height: 130,
                      width: 350,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Color(0xFFB3CFBE),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [


                              Row(
                                  children:[
                                Container(
                                  margin: const EdgeInsets.only(left: 0,top: 0,bottom: 0),
                                  height: 120,
                                  width: 80,
                                  child: Column(
                                    children: [
                                    Image.asset('assets/image12.png',
                                        height:100,
                                        width: 35,
                                        ),
                                    Container(
                                      child: Text("${temperature_value}"),
                                    )
                                  ],
                                ),
                              ),

                              Container(
                                margin: const EdgeInsets.only(left: 0,top:0),
                                height: 120,
                                width: 80,


                                child: Column(
                                  children: [
                                    Image.asset('assets/image13.png',
                                      height:100,
                                      width: 35,
                                    ),
                                    Container(
                                      child: Text("${pressure_value}"),
                                    )
                                  ],
                                ),
                              ),


                              Container(
                                margin: const EdgeInsets.only(left: 0,top: 1),
                                height: 120,
                                width: 90,

                                child: Column(
                                  children: [
                                    Image.asset('assets/image11.png',
                                      height:100,
                                      width: 35,
                                    ),
                                    Container(
                                      child: Text("${moisture_value}"),
                                    )
                                  ],
                                ),
                              ),
                              ]),
                            ],
                          ),



                          SizedBox(width: 20,),
                          Container(
                            child: FloatingActionButton(
                              onPressed: () => Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) => const weatherparameters())),
                              child: Icon(
                                Icons.arrow_forward,
                              ),
                              backgroundColor: Color(0xFFB3CFBE),


                            ),
                          ),

                        ],
                      ),
                    ),
                  ),


                  Container (
                    height: 70,
                    margin: const EdgeInsets.only(right: 300),
                    child: Positioned(
                      left: 0.30,
                      top: 0.30,
                      child: Image.asset('assets/image4.png',
                        height:105 ,
                        width: 205,
                      ),
                    ),
                  ),
                ]
            ),



            Stack(
                children: [
                  Center(
                    child:
                    Container (
                      margin:  EdgeInsets.only(top: 35,left: 15,right: 15,bottom: 0),
                      height: 130,
                      width: 350,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Color(0xFFB3CFBE),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 80),
                            child: Text("clearly day"),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 0,top: 0),
                                height: 40,
                                child: Row(
                                  children: [

                                    Container(
                                      margin: const EdgeInsets.only(left: 70),
                                      child: Text(" 170 lux "),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 150),
                              Container(
                                child: FloatingActionButton(
                                  onPressed: () => Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (context) => const luminosity())),
                                  child: Icon(
                                    Icons.arrow_forward,
                                  ),
                                  backgroundColor: Color(0xFFB3CFBE),


                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),


                  Container (
                    height: 70,
                    margin: const EdgeInsets.only(right: 300),
                    child: Positioned(
                      left: 0.30,
                      top: 0.30,
                      child: Image.asset('assets/image5.png',
                        height:105 ,
                        width: 205,
                      ),
                    ),
                  ),
                ]
            ),





            Stack(
                children: [
                  Center(
                    child:
                    Container (
                      margin:  EdgeInsets.only(top: 35,left: 15,right: 15,bottom: 0),
                      height: 130,
                      width: 350,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Color(0xFFB3CFBE),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          SizedBox(width: 270,),
                          Container(
                            child: FloatingActionButton(
                              onPressed: () => Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) => const soilmoisture())),
                              child: Icon(
                                Icons.arrow_forward,
                              ),
                              backgroundColor: Color(0xFFB3CFBE),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),


                  Container (
                    height: 70,
                    margin: const EdgeInsets.only(right: 300),
                    child: Positioned(
                      left: 0.30,
                      top: 0.30,
                      child: Image.asset('assets/image6.png',
                        height:105 ,
                        width: 205,
                      ),
                    ),
                  ),
                  Container(
                      width: 200,
                      margin: const EdgeInsets.only(left:100, top:70),
                      child: Text("Soil moisture : 14%")),
                  Container(

                      width: 200,
                      margin: const EdgeInsets.only(left:80, top:100),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6A8E78)),

                        child: Row(
                                children:[
                                  Image.asset('assets/image18.png'),
                                  Text("Thermal images"),
                                ]
                      ),
                        onPressed: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => const thermalimages())),
                  ))
                ]
            ),



            Stack(
                children: [
                  Center(
                    child:
                    Container (
                      margin: const EdgeInsets.only(top: 35,left: 15,right: 15,bottom: 0),
                      height: 70,
                      width: 350,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Color(0xFFB3CFBE),
                      ),
                    ),
                  ),


                  Container (
                    height: 50,
                    margin: const EdgeInsets.only(right: 300, top:10),
                    child: Positioned(
                      left: 0.30,
                      top: 0.30,
                      child: Image.asset('assets/image7.png',
                        height:105 ,
                        width: 205,
                      ),
                    ),

                  ),
                  Container(
                    width: 200,
                  margin: const EdgeInsets.only(left:100, top:60),
                  child: Text("Irrigation system turned on"),
                  ),
                ]
            ),

          ],
      ),
    );


  }
}






