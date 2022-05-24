import 'package:shamo/models/product.dart';

class CartModel {
  int id;
  ProductModel product;
  int quantity;

  CartModel({
    required this.id,
    required this.product,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'],
        product: ProductModel.fromJson(json['product']),
        quantity: json['quantity'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product.toJson(),
        'quantity': quantity,
      };

  getTotalPrice() {
    return product.price! * quantity;
  }
}
