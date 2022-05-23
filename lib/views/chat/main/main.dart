import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shamo/resources/resources.dart';

import 'widget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.restoreSystemUIOverlays();
    Widget header() {
      return AppBar(
        backgroundColor: AppColors.bgColor1,
        centerTitle: true,
        title: Text(
          'Message Support',
          style: AppTextStyle.primaryTextStyle.copyWith(
            fontSize: Dimens.dp18,
            fontWeight: AppTextStyle.medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: AppColors.bgColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                MainAssets.headset,
                width: Dimens.dp80,
              ),
              const SizedBox(
                height: Dimens.dp20,
              ),
              Text(
                'Oopss no message yet?',
                style: AppTextStyle.primaryTextStyle.copyWith(
                  fontSize: Dimens.dp16,
                  fontWeight: AppTextStyle.medium,
                ),
              ),
              const SizedBox(
                height: Dimens.dp12,
              ),
              Text(
                'You have never done a transaction',
                style: AppTextStyle.secondTextStyle,
              ),
              const SizedBox(
                height: Dimens.dp20,
              ),
              Container(
                color: Colors.transparent,
                height: Dimens.dp44,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.dp24,
                      vertical: Dimens.dp10,
                    ),
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimens.dp22),
                    ),
                  ),
                  child: Text(
                    'Explore Store',
                    style: AppTextStyle.primaryTextStyle.copyWith(
                      fontWeight: AppTextStyle.medium,
                      fontSize: Dimens.dp16,
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
          width: double.infinity,
          color: AppColors.bgColor3,
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.defaultMargin,
            ),
            children: const [
              ChatTile(),
              ChatTile(),
              ChatTile(),
              ChatTile(),
              ChatTile(),
              ChatTile(),
              ChatTile(),
              ChatTile(),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
