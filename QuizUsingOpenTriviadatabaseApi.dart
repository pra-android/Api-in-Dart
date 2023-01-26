import 'package:http/http.dart' as http;  //Http Packages for data fetch
import 'dart:convert';  //convert jsonstring to Map<String,dynamic>
import 'dart:io';
void main() async
{
print("WELCOME TO TRIVIA BASED API QUIZ APPLICATION");
  await getquiz();
}
Future<void> getquiz() async
{    int score=0;  //Counter to sets the score
    var requests=Uri.parse("https://opentdb.com/api.php?amount=5&category=18&difficulty=easy&type=multiple"); //API
    var response=await http.get(requests);
    Map data=json.decode(response.body);
    List list=data['results']; //It contains the list of Map
    for(var i=0; i<list.length; i++)
    {
    print(list[i]['question']);
    var correct=list[i]['correct_answer'];
    var correctoption= correct;
    var incorrectoption=list[i]['incorrect_answers'];
    incorrectoption.add(correctoption); //Adding both correct and incorrect options into a same list
    print(incorrectoption);
    print("Choos the option from 1,2,3,4 to give correct answer."); //To choose the options
    var choose1=(int.parse(stdin.readLineSync())-1);
    if(incorrectoption[choose1] == correct)
    {
         score=score+5;
         print("Your score=$score");
    }
    else
    {
         score =score;
         print("Your score=$score");
    }
    }
}