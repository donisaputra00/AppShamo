import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/models.dart';
import 'package:shamo/providers/auth.dart';
import 'package:shamo/resources/resources.dart';
import 'package:shamo/services/message.dart';

import 'widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

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
      return StreamBuilder<List<MessageModel>>(
          stream:
              MessageService().getMessageByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {

              if (snapshot.data!.isEmpty) {
                return emptyChat();
              }

              return Expanded(
                child: Container(
                  width: double.infinity,
                  color: AppColors.bgColor3,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.defaultMargin,
                    ),
                    children: [
                      ChatTile(snapshot.data!.last),
                    ],
                  ),
                ),
              );
            } else {
              return emptyChat();
            }
          });
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
