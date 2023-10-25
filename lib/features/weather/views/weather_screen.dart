import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/models/base_response.dart';
import '../../../core/utils/snackbar.dart';
import '../../../core/widgets/custom_loading.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../auth/bloc/auth_bloc.dart';
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
        child: BlocConsumer<AuthBloc, AuthState>(
          listenWhen: (_, current) =>
              current.signOutState.state == ResponseState.error,
          listener: (context, state) =>
              showErrorPopUp(context, state.signOutState.message),
          buildWhen: (previous, current) =>
              previous.signOutState != current.signOutState,
          builder: (context, state) {
            if (state.signOutState.state == ResponseState.loading) {
              return const Center(
                child: CustomLoading(),
              );
            } else {
              return BlocProvider(
                create: (BuildContext context) =>
                    WeatherBloc(weatherRepository: WeatherRepository())
                      ..add(const WeatherEvent.initiateLocationServices()),
                child: MultiBlocListener(
                  listeners: [
                    BlocListener<WeatherBloc, WeatherState>(
                      listenWhen: (previous, current) =>
                          previous.tabSelected != current.tabSelected,
                      listener: (context, state) =>
                          tabController.animateTo(state.tabSelected),
                    ),
                    BlocListener<WeatherBloc, WeatherState>(
                      listenWhen: (_, current) =>
                          current.weathers.state == ResponseState.error,
                      listener: (context, state) =>
                          showErrorPopUp(context, state.weathers.message),
                    ),
                    BlocListener<WeatherBloc, WeatherState>(
                      listenWhen: (_, current) =>
                      current.isLocationServiceEnabledState.state == ResponseState.error,
                      listener: (context, state) =>
                          showErrorPopUp(context, state.isLocationServiceEnabledState.message),
                    ),
                  ],
                  child: CustomScaffold(
                    body: TabBarView(
                      controller: tabController,
                      children: WeatherScreen.weatherPages,
                    ),
                    bottomNavigationBar: WeatherBottomNavigation(
                      tabController: tabController,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      );
}
