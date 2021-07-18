
import 'package:flutter/material.dart';

class QuizBrain{
  int _questionNumber=0;
  List<Question> _questionBank=[
    Question("How would you rate your experience with us?" ),
    Question("How did you appreciate the sanitation?"),
    Question("How was the Sound Quality?"),
    Question("How was the Lighting?"),
    Question("How likely are you to recommend this to your friends?"),
    Question("How likely are you to come back here?"),

  ];


void nextQuestion(){
  if(_questionNumber<_questionBank.length-1){
    _questionNumber++;
  }
}

String getQuestionText(){
  return _questionBank[_questionNumber].questionText;
}

void reset(){
  _questionNumber=0;
}
}






class Question{
  String questionText;


  Question(this.questionText, );
}

