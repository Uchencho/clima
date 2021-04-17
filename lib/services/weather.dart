import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const baseURL = "api.openweathermap.org";

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  Future<dynamic> getWeatherData() async {
    Location l = Location();
    await l.geCurrentLocation();

    NetworkHelper weather = NetworkHelper(
      baseURL: baseURL,
      longitude: l.longitude,
      latitude: l.latitude,
    );
    return await weather.getData();
  }

  Future<dynamic> getWeatherByCity(String cityName) async {
    print('Retrieving data for city: $cityName');
    return getWeatherData();
  }
}
