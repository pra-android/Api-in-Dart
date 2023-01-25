import 'package:http/http.dart' as http;
import 'dart:convert';
class Pokemon
{
    int  count;   //which gives values of count 
    String next;  // which gives url of next
    List<Map> results;
    Pokemon({this.count,this.next,this.results});   //Constructor

    factory Pokemon.fromjson(Map<String,dynamic> json)   //Use of Factory constructor
{
    var obj=json['results'];
    return Pokemon(count:json['count'],next:json['next'],results:List<Map>.from(obj));
}

    
}



void main()async
{
    await getvalues();
}
Future<void> getvalues()async
{
    var request=Uri.parse("https://pokeapi.co/api/v2/ability/");
    var response=await http.get(request);
    var a=Pokemon.fromjson(json.decode(response.body));  //It creates the Map<String,dynamic> object from json string.s
    print("Count=${a.count}");
    print("\nNext Link-${a.next}");
    var b=a.results;   //varible b stores the list of map
  // print("\nList of map:$b");
    print("\nList of Pokemon names:");
    for(var i=0; i<b.length; i++)
    {
        print(b[i]['name']); // It will give the name which is inside a list of map
    }
    
}
