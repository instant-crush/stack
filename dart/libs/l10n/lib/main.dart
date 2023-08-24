import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:l10n/apis/products_api.dart';
import 'package:l10n/apps/apps.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l10n/blocs/eg/eg_bloc.dart';
import 'package:l10n/blocs/l10n/l10n_bloc.dart';
import 'package:l10n/blocs/stuff/stuff_bloc.dart';
import 'package:l10n/models/models.dart';
import 'package:l10n/repos/repos.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                L10nBloc(numVal: 12345.6789, datetimeVal: DateTime.now())),
        BlocProvider(
          create: (_) => StuffBloc(),
        ),
      ],
      child: switch (defaultTargetPlatform) {
        TargetPlatform.iOS => const AppIos(),
        TargetPlatform.android => const AppMaterial(),
        _ => Container()
      }));
}
