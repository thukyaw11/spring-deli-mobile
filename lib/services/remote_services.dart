// import 'package:http/http.dart' as http;
// import 'package:spring_deli_app/models/rider.dart';

// class RemoteServices {
//   static var client = http.Client();

//   static Future<List<Rider>> fetchRiders() async {
//     var url = Uri.parse('https://spring-snacks.herokuapp.com/api/riders');
//     http.Response response = await http.get(url);

//     if (response.statusCode == 200) {
//       var jsonString = response.body;
//       print("here");
//       return riderFromJson(jsonString);
//     } else {
//       return null;
//     }
//   }
// }
