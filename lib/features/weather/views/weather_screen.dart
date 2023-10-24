import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../weather_list/views/views.dart';
import '../../../core/widgets/background_container.dart';
import '../weather.dart';
import '../weather_detail/weather_detail.dart';

class WeatherScreen extends StatefulWidget {
  static const String route = '/weather_screen';

  const WeatherScreen({super.key});

  static const List<Widget> weatherPages = [
    WeatherDetailScreen(),
    WeatherListScreen()
  ];

  static Future<void> open(BuildContext context) async =>
      Navigator.of(context).pushNamed(route);

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
  Widget build(BuildContext context) => BackgroundContainer(
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
