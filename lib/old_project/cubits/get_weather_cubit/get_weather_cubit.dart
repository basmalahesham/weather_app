import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/old_project/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/old_project/models/weather_model.dart';


import '../../services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  //GetWeatherCubit(super.initialState);
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    /*try {
      WeatherModel weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }*/
    /* try {
      WeatherModel weatherModel =
      await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel));
    } catch (e) {
      emit(WeatherFailureState(
        e.toString(),
      ));
    }
  }*/
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(
        weatherModel!
      ));
    } catch (e) {
      emit(WeatherFailureState(
        e.toString()
      ));
    }
  }
}
