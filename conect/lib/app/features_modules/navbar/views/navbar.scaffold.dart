import 'package:conect/app/config/router/named_routes.dart';
import 'package:conect/app/config/theme/mycolors.dart';
import 'package:conect/app/core/extentions/build_context_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ButtomNavBarScaffold extends ConsumerStatefulWidget {
  const ButtomNavBarScaffold(
      {super.key, required this.child, required this.tabs});
  final Widget child;
  final List<BottomNavigationBarItem> tabs;

  @override
  ConsumerState<ButtomNavBarScaffold> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ButtomNavBarScaffold> {
  static int _calculateCurrentIndex(context) {
    final String location = GoRouter.of(context).matchedLocation;
    if (location.startsWith("/${MyNamedRoutes.chats}")) {
      return 0;
    } else {
      if (location.startsWith("/${MyNamedRoutes.profile}")) {
        return 1;
      }
      return 0;
    }
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go("/${MyNamedRoutes.chats}");
        break;
      case 1:
        GoRouter.of(context).go("/${MyNamedRoutes.profile}");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: MyColors.secondary_500,
          currentIndex: _calculateCurrentIndex(context),
          items: widget.tabs,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: MyColors.primary_500,
          showUnselectedLabels: true,
          unselectedItemColor: MyColors.greyscale_500,
          selectedIconTheme: const IconThemeData(color: MyColors.primary_500),
          unselectedIconTheme:
              const IconThemeData(color: MyColors.greyscale_500),
          selectedLabelStyle: context.textTheme.bodyMedium
              ?.copyWith(color: MyColors.secondary_500),
          unselectedLabelStyle: context.textTheme.bodyMedium
              ?.copyWith(color: MyColors.greyscale_500),
          onTap: (index) => _onItemTapped(index, context),
          _currentIndex: _calculateCurrentIndex(context)),
    );
  }
}
