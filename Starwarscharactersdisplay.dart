//If you are a Stars Wars fan, create a CLI application to display the details of the Star Wars characters using the Star Wars API.
import 'package:http/http.dart'as http;
import 'dart:convert';
void main() async
{
  await getcharacters();  //Calling the function which gives value in future.
}

Future<void> getcharacters()async
{
    var url=Uri.parse("https://swapi.dev/api/people");//converting the String into URI 
    var response=await http.get(url);  //Fetching the values from internet
    //print(response.body);
    Map data=json.decode(response.body);
    List list=data['results'];
   // print(list);
   print("Characters in Star Wars");
    for(var i=0; i<list.length; i++)
    {
        var a=list[i]['name'];
    print(a);

    }
    
    
    

}