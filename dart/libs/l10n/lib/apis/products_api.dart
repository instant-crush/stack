import 'package:flutter/foundation.dart';
import 'package:l10n/models/models.dart';

final iPhone14Pro = {
  LocalesModel.de.name: {
    "storage": [
      {"label": '128GB', "installments": 54.12, "now": 1299},
      {"label": '256GB', "installments": 59.54, "now": 1429},
      {"label": '512GB', "installments": 70.37, "now": 1689},
      {"label": '1TB', "installments": 81.20, "now": 1949},
    ]
  },
  LocalesModel.en.name: {
    "storage": [
      {"label": '128GB', "installments": 41.62, "now": 999},
      {"label": '256GB', "installments": 45.79, "now": 1099},
      {"label": '512GB', "installments": 54.12, "now": 1299},
      {"label": '1TB', "installments": 62.45, "now": 1499},
    ]
  },
  LocalesModel.es.name: {
    "storage": [
      {"label": '128GB', "installments": 55.07, "now": 1321.60},
      {"label": '256GB', "installments": 60.48, "now": 1451.60},
      {"label": '512GB', "installments": 71.32, "now": 1711.60},
      {"label": '1TB', "installments": 82.15, "now": 1971.60},
    ]
  },
  LocalesModel.fr.name: {
    "storage": [
      {"label": '128GB', "now": 1329},
      {"label": '256GB', "now": 1459},
      {"label": '512GB', "now": 1719},
      {"label": '1TB', "now": 1979},
    ]
  },
  LocalesModel.it.name: {
    "storage": [
      {"label": '128GB', "installments": 55.79, "now": 1339},
      {"label": '256GB', "installments": 61.20, "now": 1469},
      {"label": '512GB', "installments": 72.04, "now": 1729},
      {"label": '1TB', "installments": 82.87, "now": 1989},
    ]
  },
  LocalesModel.ja.name: {
    "storage": [
      {"label": '128GB', "installments": 4161, "now": 149800},
      {"label": '256GB', "installments": 4577, "now": 164800},
      {"label": '512GB', "installments": 5411, "now": 194800},
      {"label": '1TB', "installments": 6244, "now": 224800},
    ]
  },
  LocalesModel.ko.name: {
    "storage": [
      {"label": '128GB', "now": 1550000},
      {"label": '256GB', "now": 1700000},
      {"label": '512GB', "now": 2000000},
      {"label": '1TB', "now": 2300000},
    ]
  },
  LocalesModel.zhHans.name: {
    "storage": [
      {"label": '128GB', "installments": 333, "now": 7999},
      {"label": '256GB', "installments": 371, "now": 8899},
      {"label": '512GB', "installments": 446, "now": 10699},
      {"label": '1TB', "installments": 521, "now": 12499},
    ]
  },
  LocalesModel.zhHant.name: {
    "storage": [
      {"label": '128GB', "now": 34900},
      {"label": '256GB', "now": 38400},
      {"label": '512GB', "now": 45400},
      {"label": '1TB', "now": 52400},
    ]
  }
};
final pixel7Pro = {
  LocalesModel.de.name: {
    "storage": [
      {"label": '128GB', "installments": 37.46, "now": 899},
      {"label": '256GB', "installments": 41.63, "now": 999},
    ]
  },
  LocalesModel.en.name: {
    "storage": [
      {"label": '128GB', "installments": 19.42, "now": 699, "original": 899},
      {"label": '256GB', "installments": 22.19, "now": 799, "original": 999},
      {"label": '512GB', "installments": 24.97, "now": 899, "original": 1099},
    ]
  },
  LocalesModel.es.name: {
    "storage": [
      {"label": '128GB', "installments": 37.46, "now": 899},
      {"label": '256GB', "installments": 41.63, "now": 999},
    ]
  },
  LocalesModel.fr.name: {
    "storage": [
      {"label": '128GB', "installments": 37.46, "now": 899},
      {"label": '256GB', "installments": 41.63, "now": 999},
    ]
  },
  LocalesModel.it.name: {
    "storage": [
      {"label": '128GB', "installments": 37.46, "now": 899},
      {"label": '256GB', "installments": 41.63, "now": 999},
    ]
  },
  LocalesModel.ja.name: {
    "storage": [
      {"label": '128GB', "now": 93225, "original": 124300},
      {"label": '256GB', "now": 104775, "original": 139700},
    ]
  },
  LocalesModel.zhHant.name: {
    "storage": [
      {"label": '128GB', "now": 20242, "original": 26990},
      {"label": '256GB', "now": 22492, "original": 29990},
    ]
  },
};

class ProductsApi {
  ProductsApi();

  getData() async {
    await Future.delayed(const Duration(seconds: 2));
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS => iPhone14Pro,
      TargetPlatform.android => pixel7Pro,
      _ => null
    };
  }
}
