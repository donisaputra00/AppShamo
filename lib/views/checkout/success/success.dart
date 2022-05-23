import 'package:flutter/material.dart';
import 'package:shamo/resources/resources.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: AppColors.bgColor1,
        centerTitle: true,
        title: Text(
          'Checkout Success',
          style: AppTextStyle.primaryTextStyle,
        ),
      );
    }

    Widget content() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              MainAssets.cartEmpty,
              width: Dimens.dp80,
            ),
            const SizedBox(
              height: Dimens.dp20,
            ),
            Text(
              'You made a transaction',
              style: AppTextStyle.primaryTextStyle.copyWith(
                fontSize: Dimens.dp16,
                fontWeight: AppTextStyle.medium,
              ),
            ),
            const SizedBox(
              height: Dimens.dp20,
            ),
            SizedBox(
              width: Dimens.width(context) / 2,
              child: Text(
                'Stay at home while we prepare your dream shoes',
                style: AppTextStyle.secondTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: Dimens.defaultMargin,
              ),
              width: Dimens.dp200,
              height: Dimens.dp44,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                },
                style: TextButton.styleFrom(
                  primary: AppColors.bgColor2,
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimens.dp12),
                  ),
                ),
                child: Text(
                  'Order Other Shoes',
                  style: AppTextStyle.primaryTextStyle.copyWith(
                    fontSize: Dimens.dp16,
                    fontWeight: AppTextStyle.medium,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: Dimens.dp12,
              ),
              width: Dimens.dp200,
              height: Dimens.dp44,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                },
                style: TextButton.styleFrom(
                  primary: AppColors.primaryColor,
                  backgroundColor: AppColors.bgColor2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimens.dp12),
                  ),
                ),
                child: Text(
                  'View My Order',
                  style: AppTextStyle.primaryTextStyle.copyWith(
                    fontSize: Dimens.dp16,
                    fontWeight: AppTextStyle.medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bgColor3,
      appBar: header(),
      body: content(),
    );
  }
}
