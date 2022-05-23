import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/providers.dart';
import 'package:shamo/resources/resources.dart';

import 'widget.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleCheckout() async {
      if (await transactionProvider.checkout(
        authProvider.user.token!,
        cartProvider.carts,
        cartProvider.totalPrice(),
      )) {
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(
            context, '/success', (route) => false);
      }
    }

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: AppColors.bgColor1,
        centerTitle: true,
        title: Text(
          'Checkout Details',
          style: AppTextStyle.primaryTextStyle,
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.defaultMargin,
          vertical: Dimens.defaultMargin,
        ),
        children: [
          // NOTE : LIST ITEMS
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'List Items',
                style: AppTextStyle.primaryTextStyle.copyWith(
                  fontSize: Dimens.dp16,
                  fontWeight: AppTextStyle.medium,
                ),
              ),
              Column(
                children: cartProvider.carts
                    .map((cart) => CheckoutCard(cart))
                    .toList(),
              ),
            ],
          ),

          // NOTE : ADDRESS DETAILS
          Container(
            margin: const EdgeInsets.only(top: Dimens.defaultMargin),
            padding: const EdgeInsets.all(Dimens.dp20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.dp12),
              color: AppColors.bgColor4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address Details',
                  style: AppTextStyle.primaryTextStyle.copyWith(
                    fontSize: Dimens.dp16,
                    fontWeight: AppTextStyle.medium,
                  ),
                ),
                const SizedBox(
                  height: Dimens.dp12,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          MainAssets.restaurant,
                          width: Dimens.dp40,
                        ),
                        Image.asset(
                          MainAssets.line,
                          height: Dimens.dp30,
                        ),
                        Image.asset(
                          MainAssets.address,
                          width: Dimens.dp40,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: Dimens.dp12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Store Location',
                          style: AppTextStyle.secondTextStyle.copyWith(
                            fontSize: Dimens.dp12,
                            fontWeight: AppTextStyle.light,
                          ),
                        ),
                        Text(
                          'Adidas Core',
                          style: AppTextStyle.primaryTextStyle.copyWith(
                            fontWeight: AppTextStyle.medium,
                          ),
                        ),
                        const SizedBox(
                          height: Dimens.defaultMargin,
                        ),
                        Text(
                          'Your Address',
                          style: AppTextStyle.secondTextStyle.copyWith(
                            fontSize: Dimens.dp12,
                            fontWeight: AppTextStyle.light,
                          ),
                        ),
                        Text(
                          'Medan, Indonesia',
                          style: AppTextStyle.primaryTextStyle.copyWith(
                            fontWeight: AppTextStyle.medium,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),

          // NOTE : PAYMENT SUMMARY
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: Dimens.defaultMargin,
            ),
            padding: const EdgeInsets.all(Dimens.dp20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.dp12),
              color: AppColors.bgColor4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: AppTextStyle.primaryTextStyle.copyWith(
                    fontSize: Dimens.dp16,
                    fontWeight: AppTextStyle.medium,
                  ),
                ),
                const SizedBox(
                  height: Dimens.dp12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Quantity',
                      style: AppTextStyle.secondTextStyle.copyWith(
                        fontSize: Dimens.dp12,
                      ),
                    ),
                    Text(
                      '${cartProvider.totalItems()} Items',
                      style: AppTextStyle.primaryTextStyle.copyWith(
                        fontWeight: AppTextStyle.medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: Dimens.dp12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Price',
                      style: AppTextStyle.secondTextStyle.copyWith(
                        fontSize: Dimens.dp12,
                      ),
                    ),
                    Text(
                      // ignore: use_raw_strings
                      '\$${cartProvider.totalPrice()}',
                      style: AppTextStyle.primaryTextStyle.copyWith(
                        fontWeight: AppTextStyle.medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: Dimens.dp12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping',
                      style: AppTextStyle.secondTextStyle.copyWith(
                        fontSize: Dimens.dp12,
                      ),
                    ),
                    Text(
                      'Free',
                      style: AppTextStyle.primaryTextStyle.copyWith(
                        fontWeight: AppTextStyle.medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: Dimens.dp12,
                ),
                const Divider(
                  thickness: 1,
                  color: AppColors.bgColor2,
                ),
                const SizedBox(
                  height: Dimens.dp10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: AppTextStyle.priceTextStyle.copyWith(
                        fontWeight: AppTextStyle.semiBold,
                      ),
                    ),
                    Text(
                      // ignore: use_raw_strings
                      '\$${cartProvider.totalPrice()}',
                      style: AppTextStyle.priceTextStyle.copyWith(
                        fontWeight: AppTextStyle.semiBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // NOTE : CHECKOUT BUTTON
          const Divider(
            thickness: 1,
            color: AppColors.bgColor2,
          ),
          Container(
            height: Dimens.dp50,
            width: double.infinity,
            margin: const EdgeInsets.only(
              top: Dimens.defaultMargin,
            ),
            child: TextButton(
              onPressed: handleCheckout,
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimens.dp26),
                ),
              ),
              child: Text(
                'Checkout Now',
                style: AppTextStyle.primaryTextStyle.copyWith(
                  fontSize: Dimens.dp16,
                  fontWeight: AppTextStyle.semiBold,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bgColor3,
      appBar: header(),
      body: content(),
    );
  }
}
