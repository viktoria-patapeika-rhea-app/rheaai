import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rheaai/blocs/bottom_navigation/bottom_navigation_event.dart';
import 'package:rheaai/blocs/bottom_navigation/bottom_navigation_state.dart';
import 'package:rheaai/repository/repositories.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc({
    required this.homePageRepository,
    required this.calendarPageRepository,
    required this.eduPageRepository,
    required this.settingsPageRepository,
  })  : assert(homePageRepository != null),
        assert(calendarPageRepository != null),
        assert(eduPageRepository != null),
        assert(settingsPageRepository != null),
        super(PageLoading());

  final HomePageRepository homePageRepository;
  final CalendarPageRepository calendarPageRepository;
  final EduPageRepository eduPageRepository;
  final SettingsPageRepository settingsPageRepository;
  int currentIndex = 0;

  BottomNavigationState get initialState => PageLoading();

  @override
  Stream<BottomNavigationState> mapEventToState(BottomNavigationEvent event) async* {
    if (event is AppStarted) {
      add(PageTapped(index: currentIndex));
    }
    if (event is PageTapped) {
      currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: currentIndex);
      yield PageLoading();

      if (currentIndex == 0) {
        yield HomePageLoaded();
      }
      if (currentIndex == 1) {
        yield CalendarPageLoaded();
      }
      if (currentIndex == 2) {
        yield EduPageLoaded();
      }
      if (currentIndex == 3) {
        yield SettingsPageLoaded();
      }
    }
  }

  // TODO: Future<Future>? check why

  String _getHomePageData() {
    String dayData = homePageRepository.getData();
    return dayData;
  }

  String _getCalendarPageData() {
    String dayData = calendarPageRepository.getData();
    return dayData;
  }

  String _getEduPageData() {
    String dayData = eduPageRepository.getData();
    return dayData;
  }

  String _getSettingsPageData() {
    String dayData = settingsPageRepository.getData();
    return dayData;
  }
}
