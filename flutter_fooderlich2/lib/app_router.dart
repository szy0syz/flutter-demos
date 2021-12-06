import 'package:flutter/material.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
// 3
  final AppStateManager appStateManager;
  // 4
  final GroceryManager groceryManager;
  // 5
  final ProfileManager profileManager;

  AppRouter({
    required this.appStateManager,
    required this.groceryManager,
    required this.profileManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {}

  @override
  Widget build(BuildContext context) {
// 7
    return Navigator(
      // 8
      key: navigatorKey,
      // TODO: Add onPopPage
      // 9
      pages: [
        // TODO: Add SplashScreen
        // TODO: Add LoginScreen
        // TODO: Add OnboardingScreen
        // TODO: Add Home
        // TODO: Create new item
        // TODO: Select GroceryItemScreen
        // TODO: Add Profile Screen
        // TODO: Add WebView Screen
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    // TODO: Handle Onboarding and splash
    // TODO: Handle state when user closes grocery item screen
    // TODO: Handle state when user closes profile screen
    // TODO: Handle state when user closes WebView screen
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
