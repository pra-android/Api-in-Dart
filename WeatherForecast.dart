import 'package:http/http.dart'as http;
import 'dart:convert';
import 'dart:io';
void main()async
{
  await getweather();
}
Future<void> getweather()async
{   
    print("Enter the city name=");
    String city=stdin.readLineSync();
    var requests=Uri.parse("http://api.openweathermap.org/geo/1.0/direct?q=$city,ISO 3166&appid=78143dce0158cb1c9e856de355eb416e"); //API
    var response=await http.get(requests);
    var output=response.body;
    var list=json.decode(output);
    //print(list);
    List result=list;
    print("City Name-${result[0]['name']}");
    print("Latitude-${result[0]['lat']}");
    print("Longitude-${result[0]['lon']}");
    var requestforweather=Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=${result[0]['lat']}&lon=${result[0]['lon']}&appid=78143dce0158cb1c9e856de355eb416e");
    var responses=await http.get(requestforweather);
    var intomap=json.decode(responses.body);
    print("Main-${intomap['weather'][0]['main']}");
    print("Descriptions-${intomap['weather'][0]['description']}");
    print("Country-${intomap['sys']['country']}");
    print("Sunrise-${intomap['sys']['sunrise']}");
    print("Sunsets-${intomap['sys']['sunset']}"); 
}
