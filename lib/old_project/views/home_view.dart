import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/old_project/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/old_project/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/old_project/views/search_view.dart';


import '../widgets/no_weather_body.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.blue,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          /*if(state is WeatherInitialState){
            return NoWeatherBody();
          } else if(state is WeatherLoadedState){
            return WeatherInfoBody();
          } else {
            return Text('opps there was an error');
          }*/
          /*if(state is WeatherInitialState){
            return NoWeatherBody();
          } else if(state is WeatherLoadedState){
            return WeatherInfoBody(
              weatherModel: state.weatherModel,
            );
          } else {
            return Text('opps there was an error');
          }*/
          if(state is WeatherInitialState){
            return const NoWeatherBody();
          } else if(state is WeatherLoadedState){
            return WeatherInfoBody(
              weatherModel: state.weatherModel,
            );
          } else {
            return const Text('opps there was an error');
          }
        },
      ),
    );
  }
}
//cubit pattern steps
//create states
//create cubit
//create function
//provide cubit
//integrate cubit
//trigger cubit