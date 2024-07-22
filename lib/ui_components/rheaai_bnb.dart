import 'package:flutter/material.dart';

enum RheaAIBNBIcon { home, calendar, edu, settings }

class RheaAIBottomNavigationBar extends StatelessWidget {
  const RheaAIBottomNavigationBar({super.key, this.onTap, required this.onAddTap, required this.currentIndex});
  final ValueChanged<int>? onTap;
  final VoidCallback onAddTap;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
