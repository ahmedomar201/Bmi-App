import 'package:flutter/material.dart';
class BmiResult extends StatelessWidget {
  final int result;
  final bool ismale;
  final int age;
    BmiResult({
      @required this.result,
      @required this.ismale,
      @required this.age,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(
            "BMI RESULT"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
                 "Gender:${ismale?"male":"female"}",
             style: TextStyle(
               fontSize: 25,
               fontWeight: FontWeight.bold,
             ),),
             Text(
              "result:$result",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
             Text(
              "Age:$age",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
          ],
        ),
      ),
    );
  }
}
