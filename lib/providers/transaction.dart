import 'package:flutter/foundation.dart';
import 'package:shamo/models/models.dart';
import 'package:shamo/services/services.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(
    String token,
    List<CartModel> carts,
    double totalPrice,
  ) async {
    try {
      if (await TransactionService().checkout(token, carts, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      return false;
    }
  }
}