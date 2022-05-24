import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vivudi/resources/app_color.dart';

import '../home/home_page.dart';
import '../profile/profile_page.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  int _index = 0;
  final List<Widget> _pages = [const HomePage(), const ProfilePage()];
  late final AnimationController popUpController;

  @override
  void initState() {
    popUpController = AnimationController(vsync: this);
    super.initState();  
  }

  void _changeIndex(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_index),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
                onPressed: () => _changeIndex(0),
              ),
            ),
            Expanded(
              child: IconButton(
                icon: const FaIcon(FontAwesomeIcons.circleUser),
                onPressed: () => _changeIndex(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
