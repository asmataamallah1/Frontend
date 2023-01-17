import 'package:flutter/material.dart';


class soilmoisture extends StatefulWidget {
  const soilmoisture({Key? key}) : super(key: key);

  @override
State<soilmoisture> createState() => _soilmoisture();
}
class _soilmoisture extends State<soilmoisture> {
  TextEditingController textEditingController = TextEditingController();

String dropdownvalue ='End-Node1';
   var items=[ 'End-Node1', 'End-Node2', 'End-Node3', 'End-Node4'];

@override
   
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: (70.0),
        centerTitle: true,
        title: const Text('Soil Moisture',
                          style: TextStyle(
                          fontSize: 25.0,
                          color: Color.fromARGB(255, 122, 114, 114),
                          letterSpacing: 2.0,
                          fontFamily: 'Palanquin',),
                          ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, 
                    color: Colors.black),
          iconSize: 35.0,
          onPressed: () => Navigator.of(context).pop(),
                ),
        actions:[ IconButton(
          icon: const Icon(Icons.menu, 
                    color: Colors.black),
          iconSize: 35.0,
          onPressed: () {},
                ),
                ],
                ),
               ),

      body: Column(
                children: [
                  Padding(
              padding: const EdgeInsets.all(12.0),
              child:
              Row(
                children: [
                  Flexible(
                    child: DropdownButton(
                      value: dropdownvalue,
                      style: const TextStyle(
                        fontSize: 27,
                        color: Colors.black,
                      ),
                      items: items.map((String items){
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),);
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue=newValue!;
                        });
                      },
                      icon: const Icon(Icons.keyboard_arrow_down_outlined, 
                      color: Colors.black,),
                      iconSize: 35.0,
                    ),
                  ),
                ]
                 )
                  ),

                  Stack(
                    children: [ 
                  
                  Center(
                    child:
                  Container (
                    margin: const EdgeInsets.only(top: 40),
                    height: 350, 
                    width: 450, 
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color.fromARGB(255, 153, 204, 148), ),
                    child: 
                    Image.asset('assets/courbe2.png',
                          height:500 ,
                          width: 350,),
                  ),
                  ),
                  
                  Positioned(
                    bottom: 280,
                    left: 200,
                    child: 
                   Image.asset('assets/image6.png',
                          height:150,
                          width: 250,),
                  ),
                               
                  ]
                  ),

                  Column(
                    children: [
                      Row(
                        
                        children: [
                        
                        Container(
                          width: 300,
                          margin:  const EdgeInsets.only(top: 5, left: 50),
                          alignment: AlignmentDirectional.center,
                          child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                          backgroundColor: Color.fromARGB(255, 159, 148, 160),
                          
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(200))),
                    ),
                    child: const Text('Import as CSV file',
                            style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily:'Palanquin',
                      ),),
            ),
          ),
          
          
          ]
                      ) ,
                      Row(
                        
                        children: [
                        
                        Container(
                          width: 300,
                          margin:  const EdgeInsets.only(top: 5, left: 50),
                          alignment: AlignmentDirectional.center,
                          child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(15, 12, 15, 12),
                          backgroundColor: Color.fromARGB(255, 159, 148, 160),

                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(200))),
                    ), 
                    child: const Text('Import as Excel file',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily:'Palanquin',
                      ),),
            ),
          ),
          ]
          ) ,
          ],
          ),
          ]
      ),
      );

   }
}