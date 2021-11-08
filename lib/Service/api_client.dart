import 'package: http/http.dart' as http;

class ApiClient {
  final Uri currencyURL = Uri.https("free.currconv.com", "/api/v7/currencies",
      {"apiKey": "d18579cc77361f6916e7"});
//the first parametr of URI should be just the main url, without http, any k
// the second parameter will bee the endpoint path
//and the 3rd parametr is a map for the different properties
// Now let's make the function to get the currencies list
  Future<List<String>> getCurrencies() async {
    http.Response res = await http.get(currencyURL);
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      var list = body["results"];
      List<String> currencies = (list.keys).toList();
      return currencies;
    } else {
      throw Exception("Failed to connect to API");
    }
  }
}
