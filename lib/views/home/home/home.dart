import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/models.dart';
import 'package:shamo/providers/providers.dart';
import 'package:shamo/resources/resources.dart';

import 'widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    Widget header() {
      return Container(
        margin: const EdgeInsets.only(
          top: Dimens.defaultMargin,
          left: Dimens.defaultMargin,
          right: Dimens.defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${user.name}',
                    style: AppTextStyle.primaryTextStyle.copyWith(
                      fontSize: Dimens.dp24,
                      fontWeight: AppTextStyle.semiBold,
                    ),
                  ),
                  Text(
                    '@${user.username}',
                    style: AppTextStyle.secondTextStyle.copyWith(
                      fontSize: Dimens.dp16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: Dimens.dp54,
              height: Dimens.dp54,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    MainAssets.profileCircle,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: const EdgeInsets.only(
          top: Dimens.defaultMargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(
                width: Dimens.defaultMargin,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.dp12,
                  vertical: Dimens.dp10,
                ),
                margin: const EdgeInsets.only(
                  right: Dimens.dp16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.dp12),
                  color: AppColors.primaryColor,
                ),
                child: Text(
                  'All Shoes',
                  style: AppTextStyle.primaryTextStyle.copyWith(
                    fontSize: Dimens.dp13,
                    fontWeight: AppTextStyle.medium,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.dp12,
                  vertical: Dimens.dp10,
                ),
                margin: const EdgeInsets.only(
                  right: Dimens.dp16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.dp12),
                  border: Border.all(
                    color: AppColors.secondTextColor,
                  ),
                  color: Colors.transparent,
                ),
                child: Text(
                  'Running',
                  style: AppTextStyle.primaryTextStyle.copyWith(
                    fontSize: Dimens.dp13,
                    fontWeight: AppTextStyle.medium,
                    color: AppColors.secondTextColor,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.dp12,
                  vertical: Dimens.dp10,
                ),
                margin: const EdgeInsets.only(
                  right: Dimens.dp16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.dp12),
                  border: Border.all(
                    color: AppColors.secondTextColor,
                  ),
                  color: Colors.transparent,
                ),
                child: Text(
                  'Training',
                  style: AppTextStyle.primaryTextStyle.copyWith(
                    fontSize: Dimens.dp13,
                    fontWeight: AppTextStyle.medium,
                    color: AppColors.secondTextColor,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.dp12,
                  vertical: Dimens.dp10,
                ),
                margin: const EdgeInsets.only(
                  right: Dimens.dp16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.dp12),
                  border: Border.all(
                    color: AppColors.secondTextColor,
                  ),
                  color: Colors.transparent,
                ),
                child: Text(
                  'Basketball',
                  style: AppTextStyle.primaryTextStyle.copyWith(
                    fontSize: Dimens.dp13,
                    fontWeight: AppTextStyle.medium,
                    color: AppColors.secondTextColor,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.dp12,
                  vertical: Dimens.dp10,
                ),
                margin: const EdgeInsets.only(
                  right: Dimens.dp16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.dp12),
                  border: Border.all(
                    color: AppColors.secondTextColor,
                  ),
                  color: Colors.transparent,
                ),
                child: Text(
                  'Hiking',
                  style: AppTextStyle.primaryTextStyle.copyWith(
                    fontSize: Dimens.dp13,
                    fontWeight: AppTextStyle.medium,
                    color: AppColors.secondTextColor,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget popularTitle() {
      return Container(
        margin: const EdgeInsets.only(
          top: Dimens.defaultMargin,
          right: Dimens.defaultMargin,
          left: Dimens.defaultMargin,
        ),
        child: Text(
          'Popular Products',
          style: AppTextStyle.primaryTextStyle.copyWith(
            fontSize: Dimens.dp22,
            fontWeight: AppTextStyle.semiBold,
          ),
        ),
      );
    }

    Widget popularProducts() {
      return Container(
        margin: const EdgeInsets.only(
          top: Dimens.dp14,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(
                width: Dimens.defaultMargin,
              ),
              Row(
                children: productProvider.products
                    .map((product) => ProductCard(product))
                    .toList(),
              ),
            ],
          ),
        ),
      );
    }

    Widget arrivalTitle() {
      return Container(
        margin: const EdgeInsets.only(
          top: Dimens.defaultMargin,
          right: Dimens.defaultMargin,
          left: Dimens.defaultMargin,
        ),
        child: Text(
          'New Arrivals',
          style: AppTextStyle.primaryTextStyle.copyWith(
            fontSize: Dimens.dp22,
            fontWeight: AppTextStyle.semiBold,
          ),
        ),
      );
    }

    Widget newArrivals() {
      return Container(
        margin: const EdgeInsets.only(
          top: Dimens.dp14,
        ),
        child: Column(
          children: productProvider.products
              .map((product) => ProductTile(product))
              .toList(),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        categories(),
        popularTitle(),
        popularProducts(),
        arrivalTitle(),
        newArrivals(),
      ],
    );
  }
}
