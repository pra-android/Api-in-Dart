import 'package:http/http.dart' as http;
import 'dart:convert';
void main() async
{
    await getquotes();
}
Future<void> getquotes() async
{
    var url=Uri.parse("http://api.quotable.io/random");
    var response=await http.get(url);
    var output=response.body.toString();
    var jsodata=json.decode(output);
    print("\t\t\t\t\tThe quote for the run is:");
    print(jsodata['content']);
}