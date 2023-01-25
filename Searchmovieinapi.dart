import'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
void main()
{ 
   
   getmovie();
}

Future<dynamic> getmovie() async
{   
     print("Enter the movie name you want to search=");
    String input=stdin.readLineSync();
    var requests=Uri.parse("https://api.themoviedb.org/3/search/movie?api_key=ea6463e55c191db139fd22120a57f774&api_key=&query=${input}");
    var response=await http.get(requests);
   // print(response.statusCode);
    var output=response.body;
    Map data=json.decode(output.toString());
    List list=data['results'];
   // print(list);
    for(var i=0; i<list.length; i++)
    {
        print("\nMoviename- ${list[i]['original_title']}");
        print("\nOverView- ${list[i]['overview']}");
        print("\nRelease Date -${list[i]['release_date']}\n");
    }
}
