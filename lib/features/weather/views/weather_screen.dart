import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/widgets/custom_scaffold.dart';
import 'package:weather_app/features/weather/weather_list/views/views.dart';
import '../../../../core/widgets/app_image.dart';
import '../weather.dart';
import '../weather_detail/weather_detail.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  static const List<Widget> weatherPages = [
    WeatherDetailScreen(),
    WeatherListScreen()
  ];

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController =
        TabController(length: WeatherScreen.weatherPages.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
            image: getJpgDecorationImage(
                imageAsset: 'starry_night', fit: BoxFit.cover)),
        child: BlocProvider(
          create: (BuildContext context) =>
              WeatherBloc(weatherRepository: WeatherRepository())
                ..add(const WeatherEvent.fetch()),
          child: BlocListener<WeatherBloc, WeatherState>(
            listenWhen: (previous, current) =>
                previous.tabSelected != current.tabSelected,
            listener: (context, state) =>
                tabController.animateTo(state.tabSelected),
            child: CustomScaffold(
              body: TabBarView(
                controller: tabController,
                children: WeatherScreen.weatherPages,
              ),
              bottomNavigationBar: BottomNavigation(
                tabController: tabController,
              ),
            ),
          ),
        ),
      );
}
