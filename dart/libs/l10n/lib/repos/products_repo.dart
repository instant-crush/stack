import 'package:l10n/apis/apis.dart';

class ProductsRepo {
  final ProductsApi _productApi;

  ProductsRepo({required ProductsApi productApi}) : _productApi = productApi;

  getData() async => _productApi.getData();
}
