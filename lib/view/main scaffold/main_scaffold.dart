import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:pass/const/colors.dart';
import 'package:pass/const/const.dart';
import 'package:pass/const/icons.dart';
import 'package:pass/view/favorites/view.dart';
import 'package:pass/view/home/view.dart';
import 'package:pass/view/main%20scaffold/controller.dart';
import 'package:pass/view/more/view.dart';
import 'package:pass/view/passes/view.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

// ignore: must_be_immutable
class MainScaffold extends StatelessWidget {
  MainScaffold({super.key});

  // MainScaffoldController controller = MainScaffoldController();
  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const FavoritesView(),
      const PassesView(),
      const MoreView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context, MainScaffoldController controller) {
    return [
      PersistentBottomNavBarItem(
        icon: CustomNavBarIcon(
          icon: AppIcons.home,
          data: 'Home'.tr,
        ),
        inactiveIcon: const InactiveIcon(
          icon: AppIcons.home,
        ),
        title: controller.titlesStatus[0] ? null : 'Home'.tr,
        textStyle: navTextStyle,
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: CustomNavBarIcon(
          icon: AppIcons.favorites,
          data: 'Favorites'.tr,
        ),
        inactiveIcon: const InactiveIcon(
          icon: AppIcons.favorites,
        ),
        title: controller.titlesStatus[1] ? null : 'Favorites'.tr,
        textStyle: navTextStyle,
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: CustomNavBarIcon(
          icon: AppIcons.passes,
          data: 'Passes'.tr,
        ),
        inactiveIcon: const InactiveIcon(
          icon: AppIcons.passes,
        ),
        title: controller.titlesStatus[2] ? null : 'Passes'.tr,
        textStyle: navTextStyle,
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: CustomNavBarIcon(
          icon: AppIcons.more,
          data: 'More'.tr,
        ),
        inactiveIcon: const InactiveIcon(
          icon: AppIcons.more,
        ),
        title: controller.titlesStatus[3] ? null : 'More'.tr,
        textStyle: navTextStyle,
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.white,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBarIcon(
                assetName: AppIcons.bell,
                onTap: () {},
              ),
              AppBarIcon(
                assetName: AppIcons.user,
                onTap: () {},
              ),
            ],
          ),
        ),
        // centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GetBuilder<MainScaffoldController>(
          init: MainScaffoldController(),
          builder: (controller) {
            return PersistentTabView(
              context,
              navBarHeight: 66,
              onItemSelected: (value) {
                controller.changeStatus(value);
                controller.update();
              },
              padding: const NavBarPadding.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              controller: controller.persistentController,
              screens: _buildScreens(),
              items: _navBarsItems(context, controller),
              confineInSafeArea: true,
              backgroundColor: AppColor.primary,
              // Default is Colors.white.
              handleAndroidBackButtonPress: true,
              // Default is true.
              resizeToAvoidBottomInset: true,
              // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
              stateManagement: true,
              // Default is true.
              hideNavigationBarWhenKeyboardShows: true,
              // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
              decoration: NavBarDecoration(
                borderRadius: BorderRadius.circular(100.0),
                colorBehindNavBar: Colors.white,
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
              navBarStyle: NavBarStyle.simple, // Choose the nav bar style with this property.
            );
          }),
    );
  }
}

class InactiveIcon extends StatelessWidget {
  const InactiveIcon({
    super.key,
    required this.icon,
  });
  final String icon;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      color: Colors.white,
      height: 20,
      width: 20,
    );
  }
}

class CustomNavBarIcon extends StatelessWidget {
  const CustomNavBarIcon({
    super.key,
    required this.icon,
    required this.data,
  });
  final String icon;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            color: Colors.black,
            height: 20,
            width: 20,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            data,
            style: navTextStyle,
          )
        ],
      ),
    );
  }
}

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({
    super.key,
    this.onTap,
    required this.assetName,
  });
  final void Function()? onTap;
  final String assetName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        assetName,
        height: 60,
        width: 60,
      ),
    );
  }
}
