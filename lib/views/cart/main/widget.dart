import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/models.dart';
import 'package:shamo/providers/providers.dart';
import 'package:shamo/resources/resources.dart';

class CartCard extends StatelessWidget {
  const CartCard(this.cart, {Key? key}) : super(key: key);

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      margin: const EdgeInsets.only(top: Dimens.defaultMargin),
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.dp16,
        vertical: Dimens.dp10,
      ),
      decoration: BoxDecoration(
        color: AppColors.bgColor4,
        borderRadius: BorderRadius.circular(Dimens.dp12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: Dimens.dp60,
                height: Dimens.dp60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.dp12),
                  image: DecorationImage(
                    image: NetworkImage(
                      cart.product.galeries![0].url,
                    ),
                    fit: BoxFit.cover,
                  ),
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
                      cart.product.name!,
                      style: AppTextStyle.primaryTextStyle.copyWith(
                        fontWeight: AppTextStyle.medium,
                      ),
                    ),
                    Text(
                      // ignore: use_raw_strings
                      '\$${cart.product.price}',
                      style: AppTextStyle.priceTextStyle,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(cart.id);
                    },
                    child: Image.asset(
                      MainAssets.plus,
                      width: Dimens.dp16,
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.dp4,
                  ),
                  Text(
                    cart.quantity.toString(),
                    style: AppTextStyle.primaryTextStyle.copyWith(
                      fontWeight: AppTextStyle.medium,
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.dp4,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuanity(cart.id);
                    },
                    child: Image.asset(
                      MainAssets.min,
                      width: Dimens.dp16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: Dimens.dp12,
          ),
          GestureDetector(
            onTap: () {
              cartProvider.removeCart(cart.id);
            },
            child: Row(
              children: [
                Image.asset(
                  MainAssets.trash,
                  width: Dimens.dp10,
                ),
                const SizedBox(
                  width: Dimens.dp6,
                ),
                Text(
                  'Remove',
                  style: AppTextStyle.primaryTextStyle.copyWith(
                    color: AppColors.alertColor,
                    fontSize: Dimens.dp12,
                    fontWeight: AppTextStyle.light,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
