import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:image_generator/api_key.dart';


// class Api{

//   static final url = Uri.parse("https://api.openai.com/v1/images/generations");
//   // static final headers = {
//   //   "Content-Type":"application/json",
//   //   "Authorization":"Bearer $apiKey"
//   // };


//   //   Future<void> makeApiRequest() async {
//   //   final apiKey = "YOUR_OPENAI_API_KEY";
//   //   final url = Uri.parse("https://api.openai.com/v1/images/generations");

//   //   final response = await http.post(
//   //     url,
//   //     headers: {
//   //       'Content-Type': 'application/json',
//   //       'Authorization': 'Bearer $apiKey',
//   //     },
//   //     body: '''
//   //     {
//   //       "prompt": "A cute baby sea otter",
//   //       "n": 2,
//   //       "size": "1024x1024"
//   //     }
//   //     ''',
//   //   );

//   //   if (response.statusCode == 200) {
//   //     // Request succeeded, you can process the response here
//   //     print(response.body);
//   //   } else {
//   //     // Request failed, handle the error
//   //     print('Request failed with status: ${response.statusCode}');
//   //   }
//   // }

//   static generateImage(String text,String size) async{

//     final response = await http.post(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $apiKey',
//       },
//       body: '''
//       {
//         "prompt": "A cute baby sea otter",
//         "n": 2,
//         "size": "1024x1024"
//       }
//       ''',
//     );

//     if(response.statusCode==200){
//       var data = jsonDecode(response.body.toString());
//       if (kDebugMode) {
//         print(data);
//       }
//       return data['data'][0]['url'].toString();
//     }
//     else{
//       print("request failed !${response.statusCode}");
//     }

//   }

// }



class Api {
  static final url = Uri.parse("https://api.openai.com/v1/images/generations");

  static Future<String> generateImage(
      String prompt, int n, String size) async {
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey",
      },
      body: jsonEncode({
        "prompt": prompt,
        "n": n,
        "size": size,
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['data'][0]['url'].toString();
    } else {
      print("Request failed! Status code: ${response.statusCode}");
      print("Request failed! Status code: ${jsonDecode(response.body)}");
      return '';
    }
  }
}
