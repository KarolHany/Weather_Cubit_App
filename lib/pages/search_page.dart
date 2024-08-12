import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_k/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_k/main.dart';
import 'package:weather_app_k/models/weather_model.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: getColor(weatherModel?.weatherCondition),
          title: const Text(
            'Search Page',
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(200),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.asset(
                  'assets/images/photoSearch (1).jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Center(
                child: TextField(
                  onSubmitted: (value) async {
                    BlocProvider.of<GetWeatherCubit>(context)
                        .getWeather(cityName: value);
                    // this is the point of trigger request to catch cityname
                    Navigator.pop(context);
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 23,
                        horizontal: 16,
                      ),
                      hintText: 'Search for a city',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      label: const Text("search")),
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ));
  }
}
