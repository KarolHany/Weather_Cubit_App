import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_k/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_k/cubits/get_weather_cubit/get_weather_cubit_states.dart';
import 'package:weather_app_k/main.dart';
import 'package:weather_app_k/models/weather_model.dart';
import 'package:weather_app_k/pages/search_page.dart';
import 'package:weather_app_k/widgets/no_weather_body.dart';
import 'package:weather_app_k/widgets/weather_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 67, 143, 206),
      appBar: AppBar(
        backgroundColor: getColor(weatherModel?.weatherCondition),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPage()));
              },
              icon: const Icon(Icons.search)),
        ],
        title: const Text(
          'Weather App',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfo();
          } else {
            return const Center(
                child: Text(
              "oops there was an error here!",
              style: TextStyle(
                fontSize: 20,
              ),
            ));
          }
        },
      ),
    );
  }
}
