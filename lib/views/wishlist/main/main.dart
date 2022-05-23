import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/providers.dart';
import 'package:shamo/resources/resources.dart';

import 'widget.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    );

    Widget header() {
      return AppBar(
        backgroundColor: AppColors.bgColor1,
        centerTitle: true,
        title: Text(
          'Favorite Shoes',
          style: AppTextStyle.primaryTextStyle,
        ),
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: AppColors.bgColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                MainAssets.wishlist,
                width: Dimens.dp74,
              ),
              const SizedBox(
                height: Dimens.dp22,
              ),
              Text(
                "You don't have dream shoes?",
                style: AppTextStyle.primaryTextStyle.copyWith(
                  fontWeight: AppTextStyle.medium,
                  fontSize: Dimens.dp16,
                ),
              ),
              const SizedBox(
                height: Dimens.dp12,
              ),
              Text(
                "Let's find your favorite shoes",
                style: AppTextStyle.secondTextStyle,
              ),
              const SizedBox(
                height: Dimens.dp20,
              ),
              SizedBox(
                height: Dimens.dp44,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.dp24,
                      vertical: Dimens.dp10,
                    ),
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimens.dp12),
                    ),
                  ),
                  child: Text(
                    'Explore Store',
                    style: AppTextStyle.primaryTextStyle.copyWith(
                      fontSize: Dimens.dp16,
                      fontWeight: AppTextStyle.medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: AppColors.bgColor3,
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.defaultMargin,
              vertical: Dimens.dp10,
            ),
            children: wishlistProvider.wishlist.map((product) => WishlistCard(product),).toList()
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        wishlistProvider.wishlist.isEmpty ? emptyWishlist() : content(),
      ],
    );
  }
}
