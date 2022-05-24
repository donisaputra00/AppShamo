import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shamo/models/models.dart';
import 'package:shamo/resources/resources.dart';
import 'package:shamo/views/chat/detail/detail.dart';

class ChatTile extends StatelessWidget {
  const ChatTile(this.message, {Key? key}) : super(key: key);

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    SystemChrome.restoreSystemUIOverlays();
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailChatPage(UninitializedProductModel()),
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: Dimens.dp12,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  MainAssets.logo,
                  width: Dimens.dp54,
                  height: Dimens.dp54,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: Dimens.dp12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shoe Store',
                        style: AppTextStyle.primaryTextStyle.copyWith(
                          fontSize: Dimens.dp15,
                        ),
                      ),
                      Text(
                        message.message!,
                        style: AppTextStyle.secondTextStyle.copyWith(
                          fontWeight: AppTextStyle.light,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Now',
                  style: AppTextStyle.secondTextStyle.copyWith(
                    fontSize: Dimens.dp10,
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
          ],
        ),
      ),
    );
  }
}
