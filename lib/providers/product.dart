import 'package:flutter/foundation.dart';
import 'package:shamo/models/models.dart';
import 'package:shamo/services/services.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();
      _products = products;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}