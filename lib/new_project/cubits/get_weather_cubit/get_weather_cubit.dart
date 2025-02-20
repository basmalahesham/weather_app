import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/new_project/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/new_project/models/weather_model.dart';

import '../../services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(
        WeatherLoadedState(
          weatherModel: weatherModel!,
        ),
      );
    } catch (e) {
      emit(
        WeatherFailureState(
          e.toString(),
        ),
      );
    }
  }
}
