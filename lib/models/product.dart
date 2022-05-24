import 'package:shamo/models/models.dart';

class ProductModel {
  int? id;
  String? name;
  double? price;
  String? description;
  String? tags;
  CategoryModel? category;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<GaleryModel>? galeries;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.galeries,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        price: double.parse(json["price"].toString()),
        description: json["description"],
        tags: json["tags"],
        category: CategoryModel.fromJson(json['category']),
        galeries: json['galeries']
            .map<GaleryModel>((galery) => GaleryModel.fromJson(galery))
            .toList(),
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "tags": tags,
        "category": category!.toJson(),
        "galeries": galeries!.map((galery) => galery.toJson()).toList(),
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
      };
}

class UninitializedProductModel extends ProductModel {}
