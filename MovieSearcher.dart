//Write a program uses OMDB movie API to provide following functionalities:
//1.Upcoming films  2.Popular Films 3.Best Rated Movies
import 'package:http/http.dart 'as http;
import 'dart:convert';
class Movies{
    List<Map> upcommingmovies;
    List<Map> popularmovies;
    List<Map> bestratedmovies;
     
     Movies({this.upcommingmovies,this.popularmovies,this.bestratedmovies});
     factory Movies.movies(Map<String,dynamic> json)     //Using Factory construtor to decode the json data
     
     {  var obj=json['results'];
        return Movies(upcommingmovies:List<Map>.from(obj),popularmovies:List<Map>.from(obj),bestratedmovies:List<Map>.from(obj));
     }
}

void main()async
{
    await getupcomingmovie();
    await getpopularmovie();
    await getbestratedmovie();
   
}
//Upcoming Movies
Future<void> getupcomingmovie()async
{
    var request=Uri.parse("https://api.themoviedb.org/3/movie/upcoming?api_key=ea6463e55c191db139fd22120a57f774&language=en-US&page=1");
    var response=await http.get(request);
    var output=response.body;
    //print(output);
    var films=Movies.movies(json.decode(output));
    //print(films.upcommingmovies);
    print("Upcomming Movies:");
    for(var i=0; i<films.upcommingmovies.length; i++)
    {

        print(films.upcommingmovies[i]['original_title']);//GIves the titlename of the movies
        //print(films.upcommingmovies[i]['overview']);   //It gives the  overview of the movies
        
    
    }

}

//Popular Movies
Future<void> getpopularmovie()async
{
    var request=Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=ea6463e55c191db139fd22120a57f774&language=en-US&page=1");
    var response=await http.get(request);
    var outputs=response.body;
    var popfilms=Movies.movies(json.decode(outputs));
    print("\nPopular Movies:");
    for(var i=0; i<popfilms.popularmovies.length; i++)
    {

        print(popfilms.popularmovies[i]['original_title']);//GIves the titlename of the movies
        //print(films.upcommingmovies[i]['overview']);   //It gives the  overview of the movies
        
    
    }

}

//Best Rated Movies
Future<void> getbestratedmovie()async
{
    var request=Uri.parse("https://api.themoviedb.org/3/movie/top_rated?api_key=ea6463e55c191db139fd22120a57f774&language=en-US&page=1");
    var response=await http.get(request);
    var outputss=response.body;
    var bestfilms=Movies.movies(json.decode(outputss));
    print("\nBest Rated  Movies:");
    for(var i=0; i<bestfilms.bestratedmovies.length; i++)
    {

        print(bestfilms.bestratedmovies[i]['original_title']);//GIves the titlename of the movies
        //print(films.upcommingmovies[i]['overview']);   //It gives the  overview of the movies
        
    
    }

}



