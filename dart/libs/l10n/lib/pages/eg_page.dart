import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:l10n/apis/products_api.dart';
import 'package:l10n/blocs/eg/eg_bloc.dart';
import 'package:l10n/blocs/l10n/l10n_bloc.dart';
import 'package:l10n/models/models.dart';
import 'package:l10n/repos/repos.dart';
import 'package:l10n/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EgPage extends StatelessWidget {
  const EgPage({super.key});

  @override
  Widget build(BuildContext context) {
    mainAsset(String v) => Center(
            child: Image.asset(
          'assets/$v',
          height: 300,
          alignment: Alignment.center,
        ));
    const textStyle = (
      title: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
      titleInfo: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      priceNow: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      priceOriginal: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.lineThrough),
      priceSave: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.green),
      priceInstallments: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
      itemTitle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      item: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      itemFeatures: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
      storageTitle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      storageInfo: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
      storageItemTitle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      storageItemInfo: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)
    );
    title(String v) => Container(
        margin: const EdgeInsets.only(top: 10),
        child: Text(v, style: textStyle.title));
    info(String v) => Container(
        margin: const EdgeInsets.only(top: 5),
        child: Text(v, style: textStyle.titleInfo));
    priceNow(String v) => Text(v, style: textStyle.priceNow);
    priceOriginal(String v) => Text(v, style: textStyle.priceOriginal);
    priceSave(String v) => Text(v, style: textStyle.priceSave);
    priceInstallments(String v) => Container(
        margin: const EdgeInsets.only(top: 5),
        child: Text(v, style: textStyle.priceInstallments));
    divider(Color v) =>
        Divider(indent: 60, endIndent: 60, height: 80, thickness: 2, color: v);
    itemTitle(String v) => Container(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
        child: Text(v, style: textStyle.itemTitle));
    itemIcon(String v) => Container(
        margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
        child: v.endsWith('svg')
            ? SvgPicture.asset('assets/$v', height: 40)
            : Image.asset(
                'assets/$v',
                alignment: Alignment.center,
              ));
    item(String v) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Text(v, textAlign: TextAlign.center, style: textStyle.item));
    itemFeatures(String v) => Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Text(v,
            textAlign: TextAlign.center, style: textStyle.itemFeatures));
    storageTitle(String v) => Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(v, style: textStyle.storageTitle));
    storageInfo(String v) => Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(v, style: textStyle.storageInfo),
        );
    storageItemTitle(String v) => Text(v, style: textStyle.storageItemTitle);
    storageItemInfo(String v) =>
        Text(v, textAlign: TextAlign.right, style: textStyle.storageItemInfo);

    return RepositoryProvider(
        create: (_) => ProductsRepo(productApi: ProductsApi()),
        child: switch (defaultTargetPlatform) {
          TargetPlatform.iOS => BlocProvider(
              create: (context) {
                final l10nState = context.read<L10nBloc>().state.locale;
                return EgBloc(productsRepo: context.read<ProductsRepo>())
                  ..add(EgIPhone14ProInit(
                      languageCode: l10nState.languageCode,
                      scriptCode: l10nState.scriptCode));
              },
              child: BlocConsumer<L10nBloc, L10nState>(
                  listener: (context, state) {
                    context.read<EgBloc>().add(EgIPhone14ProChange(
                        languageCode: state.locale.languageCode,
                        scriptCode: state.locale.scriptCode));
                  },
                  builder: (context, l10nState) => CupertinoPageScaffold(
                      navigationBar: const CupertinoNavigationBar(
                        middle: Text('iPhone14Pro'),
                        trailing: TranslateWidget(),
                      ),
                      child: SafeArea(
                          child: SingleChildScrollView(
                              child: Column(children: [
                        mainAsset('iphone14_pro.png'),
                        title('iPhone14Pro'),
                        info(AppLocalizations.of(context)!.iphone14Pro),
                        if (![
                          LocalesModel.ar.name,
                          LocalesModel.ru.name
                        ].contains(
                            '${l10nState.locale.languageCode}${l10nState.locale.scriptCode ?? ''}'))
                          Container(
                              margin: const EdgeInsets.only(top: 40),
                              child: BlocBuilder<EgBloc, EgState>(
                                  builder: (context, egState) => egState
                                              .iPhone14Pro ==
                                          null
                                      ? const CupertinoActivityIndicator()
                                      : Column(children: [
                                          priceNow(AppLocalizations.of(context)!
                                              .iphone14ProPrice(
                                                  egState.iPhone14ProNow!)),
                                          if (egState.iPhone14ProInstallments !=
                                              null)
                                            priceInstallments(AppLocalizations
                                                    .of(context)!
                                                .iphone14ProPriceInstallments(
                                                    egState
                                                        .iPhone14ProInstallments!)),
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  top: 15),
                                              child: CupertinoButton.filled(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        25, 0, 25, 0),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(30)),
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .iphone14ProBuy,
                                                ),
                                                onPressed: () {},
                                              )),
                                          storageTitle(
                                              AppLocalizations.of(context)!
                                                  .iphone14ProStorage),
                                          storageInfo(
                                              AppLocalizations.of(context)!
                                                  .iphone14ProStorageInfo),
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              child: FractionallySizedBox(
                                                  widthFactor: .7,
                                                  child: Column(
                                                    children: (egState
                                                                    .iPhone14Pro![
                                                                '${l10nState.locale.languageCode}${l10nState.locale.scriptCode ?? ''}']
                                                            ['storage'] as List)
                                                        .map((v) => GestureDetector(
                                                            child: Container(
                                                                margin: const EdgeInsets.only(bottom: 15),
                                                                padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                                                                decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(8)), border: Border.all(color: egState.iPhone14ProNow == v['now'] && egState.iPhone14ProInstallments == v['installments'] ? CupertinoColors.activeBlue : CupertinoColors.systemGrey)),
                                                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                                                  storageItemTitle(
                                                                      v['label']),
                                                                  storageItemInfo(AppLocalizations.of(context)!.iphone14ProStorageItem(
                                                                      v['installments'] ==
                                                                              null
                                                                          ? 0
                                                                          : double.parse(v['installments']
                                                                              .toString()),
                                                                      double.parse(
                                                                          v['now']
                                                                              .toString()))),
                                                                ])),
                                                            onTap: () => context.read<EgBloc>().add(EgIPhone14ProUpdate(iPhone14ProNow: double.parse(v['now'].toString()), iPhone14ProInstallments: v['installments'] == null ? null : double.parse(v['installments'].toString())))))
                                                        .toList(),
                                                  )))
                                        ]))),
                        divider(CupertinoColors.systemGrey),
                        itemTitle(AppLocalizations.of(context)!
                            .iphone14ProDisplayTitle),
                        item(AppLocalizations.of(context)!.iphone14ProDisplay),
                        itemIcon('iphone14_pro_display.png'),
                        item(AppLocalizations.of(context)!
                            .iphone14ProDynamicIsland),
                        itemFeatures(AppLocalizations.of(context)!
                            .iphone14ProDynamicIslandFeatures),
                        itemIcon('iphone14_pro_sos.png'),
                        item(AppLocalizations.of(context)!.iphone14ProSos),
                        itemIcon('iphone14_pro_camera.png'),
                        item(AppLocalizations.of(context)!.iphone14ProCamera),
                        itemFeatures(AppLocalizations.of(context)!
                            .iphone14ProCameraFeatures),
                        itemIcon('iphone14_pro_action_mode.png'),
                        item(AppLocalizations.of(context)!
                            .iphone14ProActionMode),
                        itemIcon('iphone14_pro_battery.png'),
                        item(AppLocalizations.of(context)!.iphone14ProBattery),
                        itemIcon('iphone14_pro_chip.png'),
                        item(AppLocalizations.of(context)!.iphone14ProChip),
                        itemIcon('iphone14_pro_authentication.png'),
                        item(AppLocalizations.of(context)!
                            .iphone14ProAuthentication),
                        itemIcon('iphone14_pro_cellular.png'),
                        item(AppLocalizations.of(context)!.iphone14ProCellular),
                      ])))))),
          TargetPlatform.android => BlocProvider(
              create: (context) {
                final l10nState = context.read<L10nBloc>().state.locale;
                return EgBloc(productsRepo: context.read<ProductsRepo>())
                  ..add(EgPixel7ProInit(
                      languageCode: l10nState.languageCode,
                      scriptCode: l10nState.scriptCode));
              },
              child: BlocConsumer<L10nBloc, L10nState>(
                  listener: (context, state) {
                    context.read<EgBloc>().add(EgPixel7ProChange(
                        languageCode: state.locale.languageCode,
                        scriptCode: state.locale.scriptCode));
                  },
                  builder: (context, l10nState) => Scaffold(
                      appBar: AppBar(
                        title: const Text('pixel7Pro'),
                        actions: const [TranslateWidget()],
                      ),
                      body: SingleChildScrollView(
                          child: Column(children: [
                        mainAsset('pixel7_pro.png'),
                        title('pixel7Pro'),
                        if (![
                          LocalesModel.ar.name,
                          LocalesModel.ko.name,
                          LocalesModel.ru.name,
                          LocalesModel.zhHans.name
                        ].contains(
                            '${l10nState.locale.languageCode}${l10nState.locale.scriptCode ?? ''}'))
                          Column(children: [
                            info(AppLocalizations.of(context)!.pixel7Pro),
                            Container(
                                margin: const EdgeInsets.only(top: 40),
                                child: BlocBuilder<EgBloc, EgState>(
                                    builder: (context, egState) =>
                                        egState.pixel7Pro == null
                                            ? const CircularProgressIndicator()
                                            : Column(children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      priceNow(AppLocalizations
                                                              .of(context)!
                                                          .pixel7ProPrice(egState
                                                              .pixel7ProNow!)),
                                                      if (egState
                                                              .pixel7ProOriginal !=
                                                          null)
                                                        Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .fromLTRB(
                                                                    5, 0, 5, 0),
                                                            child: priceOriginal(
                                                                AppLocalizations.of(
                                                                        context)!
                                                                    .pixel7ProPriceOriginal(
                                                                        egState
                                                                            .pixel7ProOriginal!))),
                                                      if (egState
                                                              .pixel7ProOriginal !=
                                                          null)
                                                        priceSave(AppLocalizations
                                                                .of(context)!
                                                            .pixel7ProPriceSave(
                                                                egState.pixel7ProOriginal! -
                                                                    egState
                                                                        .pixel7ProNow!)),
                                                    ]),
                                                if (egState
                                                        .pixel7ProInstallments !=
                                                    null)
                                                  priceInstallments(AppLocalizations
                                                          .of(context)!
                                                      .pixel7ProPriceInstallments(
                                                          egState
                                                              .pixel7ProInstallments!)),
                                                Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 15),
                                                    child: FilledButton(
                                                      child: Text(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .pixel7ProBuy,
                                                      ),
                                                      onPressed: () {},
                                                    )),
                                                storageTitle(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .pixel7ProStorageTitle),
                                                Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: FractionallySizedBox(
                                                        widthFactor: .7,
                                                        child: Column(
                                                          children: (egState
                                                                          .pixel7Pro![
                                                                      '${l10nState.locale.languageCode}${l10nState.locale.scriptCode ?? ''}']
                                                                  [
                                                                  'storage'] as List)
                                                              .map((v) => GestureDetector(
                                                                  child: Container(
                                                                      margin: const EdgeInsets.only(bottom: 15),
                                                                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                                                                      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(8)), border: Border.all(color: egState.pixel7ProNow == v['now'] && egState.pixel7ProInstallments == v['installments'] ? Theme.of(context).primaryColor : CupertinoColors.systemGrey)),
                                                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                                                        storageItemTitle(
                                                                            v['label']),
                                                                        storageItemInfo(
                                                                            AppLocalizations.of(context)!.pixel7ProStorageItem(double.parse(v['now'].toString()))),
                                                                      ])),
                                                                  onTap: () => context.read<EgBloc>().add(EgPixel7ProUpdate(
                                                                        pixel7ProNow:
                                                                            double.parse(v['now'].toString()),
                                                                        pixel7ProInstallments: v['installments'] ==
                                                                                null
                                                                            ? null
                                                                            : double.parse(v['installments'].toString()),
                                                                        pixel7ProOriginal: v['original'] ==
                                                                                null
                                                                            ? null
                                                                            : double.parse(v['original'].toString()),
                                                                      ))))
                                                              .toList(),
                                                        )))
                                              ]))),
                            divider(Theme.of(context).dividerColor),
                            itemTitle(AppLocalizations.of(context)!
                                .pixel7ProDisplayTitle),
                            item(
                                AppLocalizations.of(context)!.pixel7ProDisplay),
                            itemIcon('pixel7_pro_camera.svg'),
                            item(AppLocalizations.of(context)!.pixel7ProCamera),
                            itemIcon('pixel7_pro_chip.svg'),
                            item(AppLocalizations.of(context)!.pixel7ProChip),
                            itemIcon('pixel7_pro_memory.svg'),
                            itemIcon('pixel7_pro_battery.svg'),
                            item(
                                AppLocalizations.of(context)!.pixel7ProBattery),
                            itemTitle(AppLocalizations.of(context)!
                                .pixel7ProAuthenticationTitle),
                            item(AppLocalizations.of(context)!
                                .pixel7ProAuthentication),
                          ])
                      ]))))),
          _ => Container()
        });
  }
}
