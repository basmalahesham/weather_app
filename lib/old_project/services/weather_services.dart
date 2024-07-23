import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/old_project/models/weather_model.dart';


class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '081b5fb99e754523990225905240604';

  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      /*if (response.statusCode == 201){  //  طريقة كنا بنستخدمها لو مش بنستخدم ديو
        WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      } else {
      final String errorMessage = response.data['error']['message'];
        throw Exception(errorMessage);
      }*/

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ?? 'oop there was an error, try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oop there was an error, try later');
    }
  }
}
