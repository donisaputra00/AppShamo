import 'package:flutter/material.dart';
import 'package:shamo/models/models.dart';
import 'package:shamo/resources/resources.dart';
import 'package:shamo/views/views.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.product, {Key? key}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ProductPage(product),
        ));
      },
      child: Container(
        width: Dimens.dp215,
        height: Dimens.dp278,
        margin: const EdgeInsets.only(
          right: Dimens.defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.dp20),
          color: AppColors.primaryTextColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: Dimens.dp30,
            ),
            Image.network(
              product.galeries[0].url,
              width: Dimens.dp215,
              height: Dimens.dp150,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: Dimens.dp20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.name,
                    style: AppTextStyle.secondTextStyle.copyWith(
                      fontSize: Dimens.dp12,
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.dp6,
                  ),
                  Text(
                    product.name,
                    style: AppTextStyle.blackTextStyle.copyWith(
                      fontSize: Dimens.dp18,
                      fontWeight: AppTextStyle.semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: Dimens.dp6,
                  ),
                  Text(
                    '\$${product.price}',
                    style: AppTextStyle.priceTextStyle,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile(this.product, {Key? key}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ProductPage(product),
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: Dimens.defaultMargin,
          right: Dimens.defaultMargin,
          bottom: Dimens.defaultMargin,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.dp20),
              child: Image.network(
                product.galeries[0].url,
                width: Dimens.dp120,
                height: Dimens.dp120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: Dimens.dp12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.name,
                    style: AppTextStyle.secondTextStyle,
                  ),
                  Text(
                    product.name,
                    style: AppTextStyle.primaryTextStyle.copyWith(
                      fontSize: Dimens.dp16,
                      fontWeight: AppTextStyle.semiBold,
                    ),
                  ),
                  Text(
                    '\$${product.price}',
                    style: AppTextStyle.priceTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
