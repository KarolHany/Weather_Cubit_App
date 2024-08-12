import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_k/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_k/cubits/get_weather_cubit/get_weather_cubit_states.dart';
import 'package:weather_app_k/pages/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition),
              ),
              debugShowCheckedModeBanner: false,
              home: HomePage(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Partly cloudy':
    case 'Mist':
    case 'Patchy rain possible':
    case 'Light drizzle':
    case 'Patchy light drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Blizzard':
    case 'Snow':
    case 'Patchy snow possible':
    case 'Light snow':
    case 'Moderate snow':
    case 'Heavy snow':
      return Colors.lightBlue;

    case 'Overcast':
      return Colors.blueGrey;
    case 'Moderate rain':
    case 'Moderate rain at times':
    case 'Heavy rain at times':
    case 'Heavy rain':
      return Colors.blue;
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;

    case 'Cloudy':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;

    case 'Patchy freezing drizzle possible':
    case 'Freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.cyan;
    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
      return Colors.blueGrey;
    default:
      return Colors.blue;
  }
}

Color getColor(String? condition) {
  if (condition == null) {
    return Color.fromARGB(255, 67, 143, 206);
  }
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Partly cloudy':
    case 'Mist':
    case 'Patchy rain possible':
    case 'Light drizzle':
    case 'Patchy light drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Blizzard':
    case 'Snow':
    case 'Patchy snow possible':
    case 'Light snow':
    case 'Moderate snow':
    case 'Heavy snow':
      return Colors.lightBlue;

    case 'Overcast':
      return Colors.blueGrey;
    case 'Moderate rain':
    case 'Moderate rain at times':
    case 'Heavy rain at times':
    case 'Heavy rain':
      return Colors.blue;
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;

    case 'Cloudy':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;

    case 'Patchy freezing drizzle possible':
    case 'Freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.cyan;
    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
      return Colors.blueGrey;
    default:
      return Color.fromARGB(255, 67, 143, 206);
  }
}

String imageCondition(String condition) {
  switch (condition) {
    case 'Sunny':
      return "assets/animation/Weather2.json";
    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return "assets/animation/Weather1.json";
    case 'Mist':
    case 'Light drizzle':
    case 'Patchy light drizzle':
      return "assets/animation/Weather1.json";
    case 'Patchy rain possible':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain':
    case 'Moderate rain at times':
    case 'Heavy rain at times':
    case 'Heavy rain':
      return "assets/animation/Weather4.json";
    case 'Snow':
    case 'Patchy snow possible':
    case 'Light snow':
    case 'Moderate snow':
    case 'Heavy snow':
    case 'Patchy freezing drizzle possible':
    case 'Freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Blizzard':
      return "assets/animation/Weather5.json";
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return "assets/animation/Weather3.json";
    case 'Fog':
    case 'Freezing fog':
      return "assets/animation/Weather6.json";
    default:
      return "assets/animation/Weather4.json";
  }
}
