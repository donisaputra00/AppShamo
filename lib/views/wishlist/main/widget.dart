import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/models.dart';
import 'package:shamo/providers/providers.dart';
import 'package:shamo/resources/resources.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard(this.product, {Key? key}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
      margin: const EdgeInsets.only(
        top: Dimens.dp20,
      ),
      padding: const EdgeInsets.all(Dimens.dp12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.dp12),
        color: AppColors.bgColor4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimens.dp12),
            child: Image.network(
              product.galeries![0].url,
              width: Dimens.dp60,
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
                  product.name!,
                  style: AppTextStyle.primaryTextStyle.copyWith(
                    fontWeight: AppTextStyle.semiBold,
                  ),
                ),
                Text(
                  // ignore: use_raw_strings
                  '\$${product.price}',
                  style: AppTextStyle.priceTextStyle,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              wishlistProvider.setProduct(product);
            },
            child: Image.asset(
              MainAssets.loveActive,
              width: Dimens.dp34,
            ),
          ),
        ],
      ),
    );
  }
}
