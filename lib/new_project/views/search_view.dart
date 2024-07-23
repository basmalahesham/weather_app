import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/new_project/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('search city'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              suffixIcon: Icon(Icons.search),
              labelText: 'Search',
              hintText: 'Enter city name',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
