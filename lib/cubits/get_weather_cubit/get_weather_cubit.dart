import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_k/cubits/get_weather_cubit/get_weather_cubit_states.dart';
import 'package:weather_app_k/models/weather_model.dart';
import 'package:weather_app_k/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState()); // initial state
  WeatherModel? weatherModel;
  getWeather({required cityName}) async {
    // logic
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);

      emit(WeatherLoadedState()); // pass state to ui
    } catch (e) {
      emit(WeatherFailureState(errorMessage: e.toString())); // pass state to ui
    }
  }
}
