import 'package:equatable/equatable.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class CurrentIndexChanged extends BottomNavigationState {
  final int currentIndex;

  const CurrentIndexChanged({required this.currentIndex});

  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';
}

class PageLoading extends BottomNavigationState {
  @override
  String toString() => 'PageLoading';
}

class HomePageLoaded extends BottomNavigationState {
  const HomePageLoaded();
  @override
  String toString() => 'Home Page loaded';
}

class CalendarPageLoaded extends BottomNavigationState {
  const CalendarPageLoaded();
  @override
  String toString() => 'Calendar Page loaded';
}

class EduPageLoaded extends BottomNavigationState {
  const EduPageLoaded();
  @override
  String toString() => 'Edu Page loaded';
}

class SettingsPageLoaded extends BottomNavigationState {
  const SettingsPageLoaded();
  @override
  String toString() => 'Settings Page loaded';
}
