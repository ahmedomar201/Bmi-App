import 'dart:math';
import 'package:bmi_app/bmi_result.dart';
import 'package:flutter/material.dart';
class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}
class _BmiScreenState extends State<BmiScreen> {
  bool ismale =true;
  double height = 120;
  int age =20;
  int weight=40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Bmi calculator"),
      ),
      body: Column(
        children: [
          //MALE && female
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          ismale=true;
                        });

                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Image(
                        image:AssetImage("images/download.png"),
                        height:50 ,
                        width: 50,
                      ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                                "MALE",
                              style:TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ) ,)
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ismale ? Colors.blue :Colors.grey
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width:20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap:(){
                        setState(() {
                          ismale=false;
                        });
                      } ,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image:AssetImage("images/download (1).png"),
                              height:50 ,
                              width: 50,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "female",
                              style:TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ) ,)
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: !ismale ? Colors.blue :Colors.grey
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //SLIDER
          Expanded(
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ) ,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "${height.round()}",
                          style:TextStyle(
                              fontSize:30,
                              fontWeight: FontWeight.w900
                          ) ,),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "CM",
                          style:TextStyle(
                              fontSize:10,
                              fontWeight: FontWeight.bold
                          ) ,),
                      ],
                    ),
                    Slider(
                        value:height,
                        max: 220,
                        min: 80,
                        onChanged:(value){
                          setState(() {
                            height=value;
                          });
                        }),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(5),
                  color: Colors.grey[400],
                ),
              ),
            )
          ),
          //age && weight
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
           children: [
               Expanded(
                 child: Container(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(
                         "Age",
                         style:TextStyle(
                             fontSize: 15,
                             fontWeight: FontWeight.bold
                         ) ,),
                       Text(
                         "$age",
                         style:TextStyle(
                             fontSize:25,
                             fontWeight: FontWeight.w900
                         ) ,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           FloatingActionButton(
                               onPressed:(){
                                 setState(() {
                                   age--;
                                 });

                               },
                             mini:true ,
                           child:Icon(
                             Icons.remove,
                           ),
                           heroTag: "age-",),
                           FloatingActionButton(
                             onPressed:(){
                               setState(() {
                                 age++;
                               });
                             },
                             mini:true ,
                             child:Icon(
                               Icons.add,
                             ),
                               heroTag: "age+"),
                         ],
                       ),
                     ],
                   ),
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(5),
                       color: Colors.grey
                   ),
                 ),
               ),
               SizedBox(
                 width:20 ,),
               Expanded(
                 child: Container(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(
                         "Weight",
                         style:TextStyle(
                             fontSize: 15,
                             fontWeight: FontWeight.bold
                         ) ,),
                       Text(
                         "$weight",
                         style:TextStyle(
                             fontSize:25,
                             fontWeight: FontWeight.w900
                         ) ,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           FloatingActionButton(
                             onPressed:(){
                              setState(() {
                                weight--;
                              });
                             },
                             mini:true ,
                             child:Icon(
                               Icons.remove,
                             ),
                               heroTag: "weight-"),
                           FloatingActionButton(
                             onPressed:(){
                              setState(() {
                                weight++;
                              });
                             },
                             mini:true ,
                             child:Icon(
                               Icons.add,
                             ),
                               heroTag: "weight+"),
                         ],
                       )
                     ],
                   ),
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(5),
                       color: Colors.grey
                   ),
                 ),
               ),
           ],
              ),
            ),
          ),
          //button CALCULATE
          Container(
            width: double.infinity,
            child: MaterialButton(
              color: Colors.blue,
              height: 40,
              child: Text(
                  "CALCULATE",
              style:TextStyle(
                color: Colors.white
              ),),
                onPressed:(){
                  double result= weight/pow(height/100,2);
                  print(result.round());
                  Navigator.push(context,
                    MaterialPageRoute(
                        builder:(context)=>BmiResult(
                            result:result.round(),
                            ismale: ismale,
                            age: age
                        ), ));


                }),
          ),
        ],
      ),
    );
  }

}
