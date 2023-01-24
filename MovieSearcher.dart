//Write a program uses OMDB movie API to provide following functionalities
import 'package:http/http.dart 'as http;
import 'dart:convert';

void main()async
{
    await getmovie();
   await getbestratedmovie();
    await getpopularmovie();

}
//Upcomming films
Future<dynamic> getmovie() async
{
    var requests=Uri.parse("https://api.themoviedb.org/3/movie/upcoming?api_key=ea6463e55c191db139fd22120a57f774&language=en-US&page=1");
    var response=await http.get(requests);
    print(requests);
    print(response.statusCode);
    var output=response.body;
    Map data=json.decode(output.toString());
    //print(data);
    List list=data['results'];
    print("Upcomming films");
    for(var i=0; i<list.length; i++)
    {
        
        print(list[i]['original_title']);
    }
    
}

//Best Rated Films:
Future<dynamic> getbestratedmovie() async
{
    var requests=Uri.parse("https://api.themoviedb.org/3/movie/top_rated?api_key=ea6463e55c191db139fd22120a57f774&language=en-US&page=1");
    var response=await http.get(requests);
    print(response.statusCode);
    var output=response.body;
    Map data=json.decode(output.toString());
    List listS=data['results'];
    //print(listS);
    print("\nBest Rated Movies");
    for(var i=0; i<listS.length; i++)
    {
        print("${listS[i]['original_title']}");
    }
}

//Most Popular Films
Future<dynamic> getpopularmovie() async
{
    var requests=Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=ea6463e55c191db139fd22120a57f774&language=en-US&page=1");
    var response=await http.get(requests);
    print(response.statusCode);
    var output=response.body;
    Map data=json.decode(output.toString());
    List popularlists=data['results'];
    
    print("\nPopular Movies");
    for(var i=0; i<popularlists.length; i++)
    {
        print("${popularlists[i]['original_title']}");
    }
}

