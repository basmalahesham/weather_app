import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/new_project/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/new_project/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/new_project/views/home_view.dart';


void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: //CustomMaterialApp()
        Builder(
          builder: (context) =>
              BlocBuilder<GetWeatherCubit, WeatherState>(
                builder: (context, state) {
                  return MaterialApp(
                    theme: ThemeData(
                      //primarySwatch: Colors.amber,
                      //colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
                      colorScheme: ColorScheme.fromSeed(
                          seedColor: getThemeColor(
                            BlocProvider
                                .of<GetWeatherCubit>(context)
                                .weatherModel
                                ?.weatherCondition,
                          )),
                    ),
                    debugShowCheckedModeBanner: false,
                    home: const HomeView(),
                  );
                },
              ),
        ) // ,
    );
  }


}

/*class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //primarySwatch: Colors.amber,
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        colorScheme: ColorScheme.fromSeed(
            seedColor: getThemeColor(
          BlocProvider.of<GetWeatherCubit>(context)
              .weatherModel?.weatherCondition,
        )),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}*/
MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  if (condition.contains('Sunny')) {
    return Colors.orange;
  } else if (condition.contains('Cloudy') ||
      condition.contains('Overcast') ||
      condition.contains('Mist') ||
      condition.contains('Fog') ||
      condition.contains('Freezing fog')) {
    return Colors.blue;
  } else if (condition.contains('Patchy rain') ||
      condition.contains('Patchy snow') ||
      condition.contains('Patchy sleet') ||
      condition.contains('Patchy freezing drizzle') ||
      condition.contains('Patchy light drizzle') ||
      condition.contains('Light drizzle') ||
      condition.contains('Patchy light rain') ||
      condition.contains('Light rain') ||
      condition.contains('Moderate rain at times') ||
      condition.contains('Moderate rain') ||
      condition.contains('Heavy rain at times') ||
      condition.contains('Heavy rain') ||
      condition.contains('Light freezing rain') ||
      condition.contains('Moderate or heavy freezing rain') ||
      condition.contains('Light sleet') ||
      condition.contains('Moderate or heavy sleet') ||
      condition.contains('Patchy light snow') ||
      condition.contains('Light snow') ||
      condition.contains('Patchy moderate snow') ||
      condition.contains('Moderate snow') ||
      condition.contains('Patchy heavy snow') ||
      condition.contains('Heavy snow') ||
      condition.contains('Ice pellets') ||
      condition.contains('Light rain shower') ||
      condition.contains('Moderate or heavy rain shower') ||
      condition.contains('Torrential rain shower') ||
      condition.contains('Light sleet showers') ||
      condition.contains('Moderate or heavy sleet showers') ||
      condition.contains('Light snow showers') ||
      condition.contains('Moderate or heavy snow showers') ||
      condition.contains('Light showers of ice pellets') ||
      condition.contains('Moderate or heavy showers of ice pellets')) {
    return Colors.lightBlue;
  } else if (condition.contains('Thundery outbreaks possible') ||
      condition.contains('Patchy light rain with thunder') ||
      condition.contains('Moderate or heavy rain with thunder') ||
      condition.contains('Patchy light snow with thunder') ||
      condition.contains('Moderate or heavy snow with thunder')) {
    return Colors.deepPurple;
  } else if (condition.contains('Blowing snow') ||
      condition.contains('Blizzard')) {
    return Colors.red;
  } else {
    return Colors.blue;
  }
}
// api key
// 73f6a84c02ea47b5bb8160632243001
// d16719ff0af824081a93cbad34aea22c
