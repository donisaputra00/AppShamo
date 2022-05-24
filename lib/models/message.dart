import 'package:shamo/models/product.dart';

class MessageModel {
  String? message;
  int? userId;
  String? userName;
  String? userImage;
  bool? isFromUser;
  ProductModel? product;
  DateTime? createdAt;
  DateTime? updatedAt;

  MessageModel({
    this.message,
    this.userId,
    this.userName,
    this.userImage,
    this.isFromUser,
    this.product,
    this.createdAt,
    this.updatedAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        message: json['message'],
        userId: json['userId'],
        userName: json['userName'],
        userImage: json['userImage'],
        isFromUser: json['isFromUser'],
        product: json['product'].isEmpty
            ? UninitializedProductModel()
            : ProductModel.fromJson(json['product']),
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'userId': userId,
        'userName': userName,
        'userImage': userImage,
        'isFromUser': isFromUser,
        'product': product is UninitializedProductModel ? {} : product!.toJson(),
        'createdAt': createdAt.toString(),
        'updatedAt': updatedAt.toString(),
      };
}
