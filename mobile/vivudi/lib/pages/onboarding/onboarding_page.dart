import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vivudi/components/bottom_navigation_app_bar.dart';
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
  final GlobalKey keyBottomAppBar = GlobalKey();

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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: _pages.elementAt(_index),
      floatingActionButton: SizedBox.square(
        dimension: size.width / 5.3,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.primaryColor,
            child: const FaIcon(FontAwesomeIcons.plus),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationAppBar(
        key: keyBottomAppBar,
        items: const [
          ItemBottomAppBar(icon: FaIcon(FontAwesomeIcons.magnifyingGlass,), label: "Discovery"),
          ItemBottomAppBar(icon: FaIcon(FontAwesomeIcons.circleUser,), label: "Profile"),
        ],
        currentIndex: _index,
        isSelectedFontSize: 10,
        unisSelectedFontSize: 8,
        notchMargin: size.height / 120,
        iconSize: 16,
        height: size.height / 14,
        onTapItem: (index){
          _changeIndex(index);
        },
      ),
    );
  }
}
