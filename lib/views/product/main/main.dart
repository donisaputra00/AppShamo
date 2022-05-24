import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/models.dart';
import 'package:shamo/providers/providers.dart';
import 'package:shamo/resources/resources.dart';
import 'package:shamo/views/chat/detail/detail.dart';

class ProductPage extends StatefulWidget {
  const ProductPage(this.product, {Key? key}) : super(key: key);

  final ProductModel product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<String> images = [
    MainAssets.product,
    MainAssets.product,
    MainAssets.product,
  ];

  List<String> familiarShoes = [
    MainAssets.image1,
    MainAssets.image2,
    MainAssets.image3,
    MainAssets.image4,
    MainAssets.image5,
    MainAssets.image6,
    MainAssets.image7,
    MainAssets.image8,
    MainAssets.image9,
    MainAssets.image10,
    MainAssets.image11,
    MainAssets.image12,
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => SizedBox(
          width: Dimens.width(context) - (2 * Dimens.defaultMargin),
          child: AlertDialog(
            backgroundColor: AppColors.bgColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.dp30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    MainAssets.success,
                    width: Dimens.dp100,
                  ),
                  const SizedBox(
                    height: Dimens.dp12,
                  ),
                  Text(
                    'Hurray :)',
                    style: AppTextStyle.primaryTextStyle.copyWith(
                      fontSize: Dimens.dp18,
                      fontWeight: AppTextStyle.semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.dp12,
                  ),
                  Text(
                    'Item added successfully',
                    style: AppTextStyle.secondTextStyle,
                  ),
                  const SizedBox(
                    height: Dimens.dp20,
                  ),
                  SizedBox(
                    width: Dimens.dp155,
                    height: Dimens.dp44,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimens.dp24),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      child: Text(
                        'View My Cart',
                        style: AppTextStyle.primaryTextStyle.copyWith(
                          fontSize: Dimens.dp16,
                          fontWeight: AppTextStyle.medium,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? Dimens.dp16 : Dimens.dp4,
        height: Dimens.dp4,
        margin: const EdgeInsets.symmetric(
          horizontal: Dimens.dp2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.dp10),
          color: currentIndex == index
              ? AppColors.primaryColor
              : AppColors.secondTextColor,
        ),
      );
    }

    Widget familiarShoesCard(String imageUrl) {
      return Container(
        width: Dimens.dp54,
        height: Dimens.dp54,
        margin: const EdgeInsets.symmetric(horizontal: Dimens.dp8),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              imageUrl,
            ),
          ),
          borderRadius: BorderRadius.circular(Dimens.dp6),
        ),
      );
    }

    Widget header() {
      var index = -1;

      return Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: Dimens.defaultMargin,
              vertical: Dimens.dp20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    color: AppColors.bgColor1,
                  ),
                ),
                const Icon(
                  Icons.shopping_bag,
                  color: AppColors.bgColor1,
                ),
              ],
            ),
          ),
          CarouselSlider(
            items: widget.product.galeries!
                .map(
                  (image) => Image.network(
                    image.url,
                    width: Dimens.width(context),
                    height: Dimens.dp310,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          const SizedBox(
            height: Dimens.dp20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.product.galeries!.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          ),
        ],
      );
    }

    Widget content() {
      var index = -1;

      return Container(
        margin: const EdgeInsets.only(
          top: Dimens.dp16,
        ),
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimens.dp24),
          ),
          color: AppColors.bgColor1,
        ),
        child: Column(
          children: [
            // NOTE: HEADER
            Container(
              margin: const EdgeInsets.only(
                top: Dimens.defaultMargin,
                left: Dimens.defaultMargin,
                right: Dimens.defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name!,
                          style: AppTextStyle.primaryTextStyle.copyWith(
                            fontSize: Dimens.dp18,
                            fontWeight: AppTextStyle.semiBold,
                          ),
                        ),
                        Text(
                          widget.product.category!.name,
                          style: AppTextStyle.secondTextStyle.copyWith(
                            fontSize: Dimens.dp12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      wishlistProvider.setProduct(widget.product);

                      if (wishlistProvider.isWishlist(widget.product)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: AppColors.secondColor,
                            content: Text(
                              'Has been added to the wishlist',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: AppColors.alertColor,
                            content: Text(
                              'Has been removed from the wishlist',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    child: Image.asset(
                      wishlistProvider.isWishlist(widget.product)
                          ? MainAssets.loveActive
                          : MainAssets.love,
                      width: Dimens.dp46,
                    ),
                  ),
                ],
              ),
            ),

            // NOTE: PRICE
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                top: Dimens.dp20,
                left: Dimens.defaultMargin,
                right: Dimens.defaultMargin,
              ),
              padding: const EdgeInsets.all(Dimens.dp16),
              decoration: BoxDecoration(
                color: AppColors.bgColor2,
                borderRadius: BorderRadius.circular(Dimens.dp4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price starts from',
                    style: AppTextStyle.primaryTextStyle,
                  ),
                  Text(
                    // ignore: use_raw_strings
                    '\$${widget.product.price}',
                    style: AppTextStyle.priceTextStyle.copyWith(
                      fontSize: Dimens.dp16,
                    ),
                  ),
                ],
              ),
            ),

            // NOTE: DESCRIPTION
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(Dimens.defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: AppTextStyle.primaryTextStyle.copyWith(
                      fontWeight: AppTextStyle.medium,
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.dp12,
                  ),
                  Text(
                    widget.product.description!,
                    style: AppTextStyle.secondTextStyle.copyWith(
                      fontWeight: AppTextStyle.light,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            // NOTE: FAMILIAR SHOES
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.defaultMargin,
                    ),
                    child: Text(
                      'Familiar Shoes',
                      style: AppTextStyle.primaryTextStyle.copyWith(
                        fontWeight: AppTextStyle.medium,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.dp12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: familiarShoes.map((image) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            left: index == 0 ? Dimens.dp22 : 0,
                          ),
                          child: familiarShoesCard(image),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            // NOTE: BUTTON
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(Dimens.defaultMargin),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailChatPage(widget.product),
                          ));
                    },
                    child: Container(
                      width: Dimens.dp54,
                      height: Dimens.dp54,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(MainAssets.buttonChat),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: Dimens.dp16,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: Dimens.dp54,
                      child: TextButton(
                        onPressed: () {
                          cartProvider.addCart(widget.product);
                          showSuccessDialog();
                        },
                        style: TextButton.styleFrom(
                          primary: AppColors.primaryTextColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Dimens.dp12),
                          ),
                          backgroundColor: AppColors.primaryColor,
                        ),
                        child: Text(
                          'Add to Cart',
                          style: AppTextStyle.primaryTextStyle.copyWith(
                            fontSize: Dimens.dp16,
                            fontWeight: AppTextStyle.semiBold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bgColor6,
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            content(),
          ],
        ),
      ),
    );
  }
}
