import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import '../services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.weatherData});
  final weatherData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  int temperature;
  var conditionId;
  var cityName;
  String weatherIcon;
  String weatherMessage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic weatherInfo) {
    setState(() {
      //**In case of weather data cannot be fetched with the API usage from the
      // OpenWeatherMap because of some errors or conditions such as turning off
      //the Location settings on the device, an error on the server of OpenWeatherMap,
      //etc. an if control is added to check this and it aims to prevent the crash
      //of the app;
      if (weatherInfo == null) {
        temperature = 0;
        weatherIcon = 'Error!';
        weatherMessage = 'Unable to fetch weather data!';
        cityName = '';
        return;
      }
      temperature = (weatherInfo['main']['temp']).toInt();
      var conditionId = weatherInfo['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(conditionId);
      weatherMessage = weather.getMessage(temperature);
      cityName = weatherInfo['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var locationWeather = await weather.getLocationWeather();
                      updateUI(locationWeather);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedCity = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CityScreen(),
                          ));
                      if (typedCity != null) {
                        var weatherInfoUpd =
                            await weather.getCityWeather(typedCity);
                        updateUI(weatherInfoUpd);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*var decodedData = jsonDecode(responseBody);
      var weatherTemp = ;
decodedData['main']['temp']
      //*=>JsonViewerPro'dan 'Copy path' sonrasinda donen data -> weather[0].id
      var weatherId = decodedData['weather'][0]['id'];
      var cityName = decodedData['name'];
      print(
          'weather temp: ${(weatherTemp - 273.15).toStringAsFixed(2)}, weather id: $weatherId, city name: $cityName');
          */
 */
