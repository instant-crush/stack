import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l10n/blocs/stuff/stuff_bloc.dart';
import 'package:l10n/widgets/widgets.dart';

class TranslateWidget extends StatelessWidget {
  const TranslateWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<StuffBloc, StuffState, bool>(
          selector: (state) => state.bottom,
          builder: (context, state) => switch (defaultTargetPlatform) {
                TargetPlatform.iOS => CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    child: const Icon(CupertinoIcons.globe),
                    onPressed: () => showCupertinoModalPopup(
                      context: context,
                      builder: (context) => Container(
                          color: CupertinoColors.systemBackground
                              .resolveFrom(context),
                          height: 300,
                          child: const TranslateBottomWidget()),
                    ),
                  ),
                TargetPlatform.android => IconButton(
                    icon: const Icon(Icons.translate),
                    onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => const TranslateBottomWidget(),
                    ),
                  ),
                _ => Container()
              });
}
