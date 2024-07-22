import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rheaai/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:rheaai/blocs/bottom_navigation/bottom_navigation_event.dart';
import 'package:rheaai/repository/bottom_navigation/calendar_page_repository.dart';
import 'package:rheaai/repository/bottom_navigation/edu_page_repository.dart';
import 'package:rheaai/repository/bottom_navigation/home_page_repository.dart';
import 'package:rheaai/repository/bottom_navigation/settings_page_repository.dart';
import 'package:rheaai/ui_components/views.dart';

class SimpleBlocObserver extends BlocObserver {
  void onTrandition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<BottomNavigationBloc>(
        create: (context) => BottomNavigationBloc(
          homePageRepository: HomePageRepository(),
          calendarPageRepository: CalendarPageRepository(),
          eduPageRepository: EduPageRepository(),
          settingsPageRepository: SettingsPageRepository(),
        )..add(AppStarted()),
        child: const AppPage(),
      ),
    );
  }
}
