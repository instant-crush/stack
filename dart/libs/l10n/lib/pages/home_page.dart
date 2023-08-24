import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:l10n/blocs/stuff/stuff_bloc.dart';
import 'package:l10n/pages/pages.dart';

class HomePage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const HomePage({required this.navigationShell, super.key});

  void _change(int index) => navigationShell.goBranch(index,
      initialLocation: index == navigationShell.currentIndex);

  @override
  Widget build(BuildContext context) {
    const List<String> bottomNavigationBarItemLabels = ['lib', 'e.g.'];

    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS => CupertinoTabScaffold(
          key: UniqueKey(),
          tabBar: CupertinoTabBar(
              currentIndex: navigationShell.currentIndex,
              onTap: _change,
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(CupertinoIcons.list_bullet),
                    label: bottomNavigationBarItemLabels[0]),
                BottomNavigationBarItem(
                    icon: const Icon(CupertinoIcons.square_list),
                    label: bottomNavigationBarItemLabels[1]),
              ]),
          tabBuilder: (_, __) => navigationShell),
      TargetPlatform.android => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: navigationShell.currentIndex,
              onTap: _change,
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(Icons.format_list_bulleted),
                    label: bottomNavigationBarItemLabels[0]),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.list_alt),
                    label: bottomNavigationBarItemLabels[1]),
              ]),
          body: navigationShell),
      _ => Container()
    };
  }
}
