import 'dart:convert';

import 'package:http/http.dart' as http;

const apiKey = 'e72ca729af228beabd5d20e3b7749713'; // not working

class NetworkHelper {
  NetworkHelper({this.baseURL, this.longitude, this.latitude});

  final String baseURL;
  final double longitude;
  final double latitude;

  Future getData() async {
    var url = Uri.https(this.baseURL, "/data/2.5/weather", {
      "lat": '$latitude',
      "lon": '$longitude',
      "appid": apiKey,
      "units": "metric"
    });

    print('making request to url: $url');
    http.Response resp = await http.get(url);
    if (resp.statusCode == 200) {
      return jsonDecode(resp.body);

      // double temp = decodedData['main']['temp'];
      // int condition = decodedData['weather'][0]['id'];
      // String cityName = decodedData['name'];
      // print('Temperature: $temp, Condition: $condition, City: $cityName');
    } else {
      int sC = resp.statusCode;
      print('Invalid status code, expected 200, received $sC');
      return {
        'name': 'Lagos',
        'main': {'temp': 15.0},
        'weather': [
          {'id': 300}
        ]
      };
    }
    // print(resp.headers);
  }
}
