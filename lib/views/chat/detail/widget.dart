import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shamo/resources/resources.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    this.text = '',
    this.isSender = false,
    this.hasProduct = false,
  }) : super(key: key);

  final String text;
  final bool isSender;
  final bool hasProduct;

  @override
  Widget build(BuildContext context) {
    SystemChrome.restoreSystemUIOverlays();
    Widget productPreview() {
      return Container(
        width: Dimens.dp230,
        margin: const EdgeInsets.only(
          bottom: Dimens.dp12,
        ),
        padding: const EdgeInsets.all(Dimens.dp12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isSender ? Dimens.dp12 : 0),
            topRight: Radius.circular(isSender ? 0 : Dimens.dp12),
            bottomLeft: const Radius.circular(Dimens.dp12),
            bottomRight: const Radius.circular(Dimens.dp12),
          ),
          color: isSender ? AppColors.bgColor5 : AppColors.bgColor4,
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimens.dp12),
                  child: Image.asset(
                    MainAssets.product,
                    width: Dimens.dp70,
                  ),
                ),
                const SizedBox(
                  width: Dimens.dp8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'COURT VISION 2.0 SHOES',
                        style: AppTextStyle.primaryTextStyle,
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
              ],
            ),
            const SizedBox(
              height: Dimens.dp20,
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: AppColors.primaryColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimens.dp8),
                    ),
                  ),
                  child: Text(
                    'Add to Cart',
                    style: AppTextStyle.purpleTextStyle,
                  ),
                ),
                const SizedBox(
                  width: Dimens.dp8,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimens.dp8),
                    ),
                    primary: AppColors.bgColor5,
                  ),
                  child: Text(
                    'Buy Now',
                    style: AppTextStyle.primaryTextStyle.copyWith(
                      color: AppColors.bgColor5,
                      fontWeight: AppTextStyle.medium,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: Dimens.dp30,
      ),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (hasProduct) productPreview() else const SizedBox(),
          Row(
            mainAxisAlignment:
                isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: Dimens.width(context) * 0.7,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.dp16,
                    vertical: Dimens.dp12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSender ? Dimens.dp12 : 0),
                      topRight: Radius.circular(isSender ? 0 : Dimens.dp12),
                      bottomLeft: const Radius.circular(Dimens.dp12),
                      bottomRight: const Radius.circular(Dimens.dp12),
                    ),
                    color: isSender ? AppColors.bgColor5 : AppColors.bgColor4,
                  ),
                  child: Text(
                    text,
                    style: AppTextStyle.primaryTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
