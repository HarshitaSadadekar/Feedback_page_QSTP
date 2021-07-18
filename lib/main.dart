import 'package:feedback_app_qstp/quizbrain.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
       scaffoldBackgroundColor: Colors.white,
      ),
      home: headerSec(),

      );

  }
}

class headerSec extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[700],
          title: Text('Quiz App', style: TextStyle(color: Colors.white),),
        ),
        body: feedbackSlider(),
      );
   }
}

class feedbackSlider extends StatefulWidget {
   @override
  _feedbackSliderState createState() => _feedbackSliderState();
}

class _feedbackSliderState extends State<feedbackSlider>{

  int score=1;
  int totalscore=0;

  @override
  Widget build(BuildContext context){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [
          Center(
            child: Text(QuizBrain.getQuestionText()),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              inactiveTrackColor:Colors.yellow[700] ,
              activeTrackColor: Colors.deepPurple,
              thumbColor: Colors.yellow[700],
              overlayColor:Colors.yellowAccent,
              // activeTickMarkColor: Colors.black,
              // inactiveTickMarkColor: Colors.white,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
            ),
            child: Slider(value: score.toDouble(),
              min: 1.0, max: 5.0, divisions: 4,
              label: score.toString(),
              onChanged: (double newValue){
                setState(() {
                  score=newValue.round();
                });
              },
            ),
          ),
          Container(
            child: TextButton(
              style: ButtonStyle( backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple), foregroundColor:  MaterialStateProperty.all<Color>(Colors.white)),
              child: Text('Next'),
              onPressed: (){
                setState(() {
                  QuizBrain.nextQuestion();
                  totalscore+=score;
                });
                },
            ),
          ),

        ],
      );
  }
}

