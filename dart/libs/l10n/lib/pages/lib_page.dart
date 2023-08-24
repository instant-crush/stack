import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:l10n/widgets/widgets.dart';

class LibPage extends StatelessWidget {
  const LibPage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = Text('lib');
    const routes = [
      'placeholder',
      'plurals',
      'select',
      'gender',
      'num',
      'datetime'
    ];

    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS => CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            middle: title,
            trailing: TranslateWidget(),
          ),
          child: SafeArea(
              child: SingleChildScrollView(
                  child: CupertinoListSection(
            children: routes
                .map((v) => CupertinoListTile(
                      title: Text(v),
                      trailing: const CupertinoListTileChevron(),
                      onTap: () => context.goNamed(v),
                    ))
                .toList(),
          )))),
      TargetPlatform.android => Scaffold(
          appBar: AppBar(
            title: title,
            actions: const [TranslateWidget()],
          ),
          body: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                    dense: true,
                    title: Text(routes[index]),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () => context.goNamed(routes[index]),
                  ),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: routes.length)),
      _ => Container()
    };
  }
}
