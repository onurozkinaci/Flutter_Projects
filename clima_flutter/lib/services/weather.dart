import 'location.dart';
import 'networking.dart';

const apiKey = 'b04d8c23b5400213feeba9788ee07723';

class WeatherModel {
  var url;

  Future<dynamic> getCityWeather(String cityName) async {
    url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': '$cityName',
      'appid': '$apiKey',
      'units': 'metric',
    });
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherInfo = await networkHelper.getData();
    return weatherInfo;
  }

  /*This refactored method can be used in many files easily such as loading_screen.dart and location_screen.dart since it has
  a better modularized structure right now;*/
  Future<dynamic> getLocationWeather() async {
    //Getting the location value of the user with the reformatted code which is placed into 'location.dart' file;
    Location location = Location();
    await location.getCurrentLocation();
    /*print(location.longitude);
    print(location.latitude);*/

    //**Assigning the url information to fetch a data later on =>"units:metric" ile Kelvin yerine Celsius ile sicaklik
    //derecesi elde edilebilir;
    url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': '${location.latitude}',
      'lon': '${location.longitude}',
      'appid': apiKey.toString(),
      'units': 'metric'
    });

    //**Fetching data from an external resource via API usage with the refactored code;
    NetworkHelper helper = NetworkHelper(url: url);
    var weatherData = await helper.getData();
    return weatherData;
  }

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
}
