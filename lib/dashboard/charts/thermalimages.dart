import 'package:flutter/material.dart';

class thermalimages extends StatefulWidget {
  const thermalimages({Key? key}) : super(key: key);

  @override
State<thermalimages> createState() => _thermalimages();
}
class _thermalimages extends State<thermalimages> {
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
        title: const Text('Thermal images',
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
                    
    
      body:  Column( 
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
                ],
            ),
            ),

            Center(
              child:
            Container(
              width: 420,
              height: 512,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Color.fromARGB(255, 153, 204, 148), ),
              //alignment: AlignmentDirectional.topCenter, 
              //ajouter du padding ?depasse la page ?
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 230, 20),
                    child:
                      const Text('11/12/2022',
                      style: TextStyle(
                        fontSize: 23.0,
                        fontFamily:'Palanquin',
                        fontWeight: FontWeight.bold,
                  )),
                  ),
                  Row(
                    children:[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                        child:                     
                      Column(
                        
                        children:[
                        const Text('9 A.M',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontFamily:'Palanquin', 
                            fontWeight: FontWeight.bold,
                      ),),
                                                             
                      Row(children:[
                      Column(
                        children: [
                          const Padding(padding: EdgeInsets.only(bottom: 7),
                                  child: 
                          Text('Before irrigation',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                          ),
                          Image.asset('assets/image9.png',
                          height:75 ,
                          width: 175,),
                      ],
                      ),
                      Column(children: [
                        const Padding(padding: EdgeInsets.only(bottom: 7),
                                  child: 
                        Text('After irrigation',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                        Image.asset('assets/image8.png',
                        height:75 ,
                        width: 175,),
                      ],),
                      ],),
                      ],),
                       ),
                    ],
                  ),
                //
                Row(
                    children:[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                        child:                     
                      Column(
                        
                        children:[
                        const Text('8 A.M',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontFamily:'Palanquin', 
                            fontWeight: FontWeight.bold,
                      ),),
                                                             
                      Row(children:[
                      Column(
                        children: [
                          const Padding(padding: EdgeInsets.only(bottom: 7),
                                  child: 
                          Text('Before irrigation',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                          ),
                          Image.asset('assets/image9.png',
                          height:75 ,
                          width: 175,),
                      ],
                      ),
                      Column(children: [
                        const Padding(padding: EdgeInsets.only(bottom: 7),
                                  child: 
                        Text('After irrigation',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                        Image.asset('assets/image8.png',
                        height:75 ,
                        width: 175,),
                      ],),
                      ],),
                      ],),
                       ),
                    ],
                  ),

              ],
            ),
            ),
      ),

            ]
          
  
          ),
          
        
        );
      
      
  }
}