import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shamo/resources/resources.dart';

import 'widget.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.restoreSystemUIOverlays();
    PreferredSize header() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(Dimens.dp70),
        child: AppBar(
          backgroundColor: AppColors.bgColor1,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                MainAssets.logo,
                width: Dimens.dp50,
              ),
              const SizedBox(
                width: Dimens.dp12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    style: AppTextStyle.primaryTextStyle.copyWith(
                      fontWeight: AppTextStyle.medium,
                      fontSize: Dimens.dp14,
                    ),
                  ),
                  Text(
                    'Online',
                    style: AppTextStyle.secondTextStyle.copyWith(
                      fontWeight: AppTextStyle.light,
                      fontSize: Dimens.dp14,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget productPreview() {
      return Container(
        width: Dimens.dp255,
        height: Dimens.dp74,
        margin: const EdgeInsets.only(bottom: Dimens.dp20),
        padding: const EdgeInsets.all(Dimens.dp10),
        decoration: BoxDecoration(
          color: AppColors.bgColor5,
          borderRadius: BorderRadius.circular(Dimens.dp12),
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.dp12),
              child: Image.asset(
                MainAssets.product,
                width: Dimens.dp54,
              ),
            ),
            const SizedBox(
              width: Dimens.dp10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'COURT VISION NEW ARRIVALS',
                    style: AppTextStyle.primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: Dimens.dp2,
                  ),
                  Text(
                    // ignore: use_raw_strings
                    '\$57,15',
                    style: AppTextStyle.priceTextStyle.copyWith(
                      fontWeight: AppTextStyle.medium,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              MainAssets.close,
              width: Dimens.dp22,
            ),
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.all(Dimens.dp20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productPreview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: Dimens.dp44,
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.dp16,
                      vertical: Dimens.dp12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.bgColor4,
                      borderRadius: BorderRadius.circular(Dimens.dp22),
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type Message...',
                          hintStyle: AppTextStyle.secondTextStyle.copyWith(
                            fontSize: Dimens.dp14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: Dimens.dp20,
                ),
                Image.asset(
                  MainAssets.submitCircle,
                  height: Dimens.dp44,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.defaultMargin,
        ),
        children: const [
          ChatBubble(
            isSender: true,
            hasProduct: true,
            text: 'Hi, this item is still available?',
          ),
          ChatBubble(
            text: 'Good night, This item is only available in size 42 and 43',
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bgColor3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
