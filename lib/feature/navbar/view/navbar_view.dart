import 'package:chefistant_food_recipe_helper/feature/ai_recipe_home/view/ai_recipe_home_view.dart';
import 'package:chefistant_food_recipe_helper/feature/home/view/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavbarView extends StatelessWidget {
  const NavbarView({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: const Color(0xff242424), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: const Color(0xff242424),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}

List<Widget> _buildScreens() {
  return [const HomeView(), AiRecipeHomeView(), const HomeView(), AiRecipeHomeView()];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.white,
        title: "Explore"),
    PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.chat_bubble_fill),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.white,
        title: "AI"),
    PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.doc_chart_fill),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.white,
        title: "Advice"),
    PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.white,
        title: "Profile"),
  ];
}
