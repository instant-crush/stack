import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:l10n/pages/pages.dart';

final router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    debugLogDiagnostics: true,
    initialLocation: '/lib',
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              HomePage(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
                navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'lib'),
                routes: [
                  GoRoute(
                      name: 'lib',
                      path: '/lib',
                      builder: (_, __) => const LibPage(),
                      routes: [
                        GoRoute(
                          name: 'placeholder',
                          path: 'placeholder',
                          builder: (_, __) => const LibPlaceholderPage(),
                        ),
                        GoRoute(
                          name: 'plurals',
                          path: 'plurals',
                          builder: (_, __) => const LibPluralsPage(),
                        ),
                        GoRoute(
                          name: 'select',
                          path: 'select',
                          builder: (_, __) => const LibSelectPage(),
                        ),
                        GoRoute(
                          name: 'gender',
                          path: 'gender',
                          builder: (_, __) => const LibGenderPage(),
                        ),
                        GoRoute(
                          name: 'num',
                          path: 'num',
                          builder: (_, __) => const LibNumPage(),
                        ),
                        GoRoute(
                          name: 'datetime',
                          path: 'datetime',
                          builder: (_, __) => const LibDatetimePage(),
                        ),
                      ])
                ]),
            StatefulShellBranch(
                navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'eg'),
                routes: [
                  GoRoute(
                    name: 'eg',
                    path: '/eg',
                    builder: (_, __) => const EgPage(),
                  )
                ])
          ])
    ]);
