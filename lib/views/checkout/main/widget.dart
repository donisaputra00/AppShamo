import 'package:flutter/material.dart';
import 'package:shamo/models/models.dart';
import 'package:shamo/resources/resources.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard(this.cart, {Key? key}) : super(key: key);

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: Dimens.dp12,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.dp12,
        vertical: Dimens.dp20,
      ),
      decoration: BoxDecoration(
        color: AppColors.bgColor4,
        borderRadius: BorderRadius.circular(Dimens.dp12),
      ),
      child: Row(
        children: [
          Container(
            width: Dimens.dp60,
            height: Dimens.dp60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.dp12),
              image: DecorationImage(
                image: NetworkImage(cart.product.galeries[0].url),
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
                  cart.product.name,
                  style: AppTextStyle.primaryTextStyle.copyWith(
                    fontWeight: AppTextStyle.semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  // ignore: use_raw_strings
                  '\$${cart.product.price}',
                  style: AppTextStyle.priceTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: Dimens.dp12,
          ),
          Text(
            '${cart.quantity} Items',
            style: AppTextStyle.secondTextStyle.copyWith(
              fontSize: Dimens.dp12,
            ),
          ),
        ],
      ),
    );
  }
}
