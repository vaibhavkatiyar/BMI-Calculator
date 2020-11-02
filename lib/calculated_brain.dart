import 'dart:math';

class CalculatedBrain{
  CalculatedBrain({this.height,this.weight});

  final int height;
  final int weight;

  double _BMI;

  String calculateBMI(){
    _BMI=weight/pow(height/100,2);
    return _BMI.toStringAsFixed(1);

}
 String getResult(){
    if(_BMI >= 25)
      {
        return 'OVERWEIGHT';
      }
    else if(_BMI > 18.5)
      {
        return 'NORMAL';
      }
    else{
      return 'UNDERWEIGHT';
    }
 }

String interpretation(){
  if(_BMI >= 25)
  {
    return 'Lose up some weight fat boy!';
  }
  else if(_BMI > 18.5)
  {
    return 'Good job but try to maintain it';
  }
  else{
    return 'Gain some weight skinny boy!';
  }
}
}

