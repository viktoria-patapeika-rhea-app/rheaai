import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rheaai/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:rheaai/blocs/bottom_navigation/bottom_navigation_state.dart';
import 'package:rheaai/ui_components/views.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBloc bottomNavigationBloc = BlocProvider.of<BottomNavigationBloc>(context);
    return Scaffold(
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          bloc: bottomNavigationBloc,
          builder: (context, state) {
            if (state is PageLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is HomePageLoaded) {
              return HomePage();
            }
            if (state is CalendarPageLoaded) {
              return CalendarPage();
            }
            if (state is EduPageLoaded) {
              return EduPage();
            }
            if (state is SettingsPageLoaded) {
              return SettingsPage();
            }
            return Container();
          }),
      // bottomNavigationBar: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(builder: BuildContext context, BottomNaviagtionState state){return BottomNavigationBar();},
    );
  }
}
