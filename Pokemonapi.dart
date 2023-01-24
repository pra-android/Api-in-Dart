import 'package:http/http.dart 'as http;
import 'dart:convert';
import 'dart:async';
const request="https://pokeapi.co/api/v2/ability/";

Map data;
List list;
void main()async
{
  await getvalues('1');
}
Future<dynamic> getvalues(String api)async
{
    var url=Uri.parse(request+api);
    var response=await http.get(url);
    print(response.body);
    data=json.decode(response.body);
    list=data["names"];
    print(list);
    for(var i=0; i<list.length; i++)
    {
        print(list[i]['name']);
    }
    print("My favoutite pokemon out of these are ${list[7]['name']}");
}