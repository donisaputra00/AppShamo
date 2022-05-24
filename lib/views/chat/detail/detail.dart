// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/models.dart';
import 'package:shamo/providers/auth.dart';
import 'package:shamo/resources/resources.dart';
import 'package:shamo/services/message.dart';

import 'widget.dart';

class DetailChatPage extends StatefulWidget {
  DetailChatPage(this.product, {Key? key}) : super(key: key);

  ProductModel product;

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  TextEditingController messageController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    SystemChrome.restoreSystemUIOverlays();

    handleAddMessage() async {
      await MessageService().addMessage(
        user: authProvider.user,
        isFromUser: true,
        product: widget.product,
        message: messageController.text,
      );

      setState(() {
        widget.product = UninitializedProductModel();
        messageController.text = '';
      });
    }

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
              child: Image.network(
                widget.product.galeries![0].url,
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
                    widget.product.name!,
                    style: AppTextStyle.primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: Dimens.dp2,
                  ),
                  Text(
                    // ignore: use_raw_strings
                    '\$${widget.product.price!}',
                    style: AppTextStyle.priceTextStyle.copyWith(
                      fontWeight: AppTextStyle.medium,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.product = UninitializedProductModel();
                });
              },
              child: Image.asset(
                MainAssets.close,
                width: Dimens.dp22,
              ),
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
            widget.product is UninitializedProductModel
                ? const SizedBox()
                : productPreview(),
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
                        controller: messageController,
                        style: AppTextStyle.primaryTextStyle,
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
                GestureDetector(
                  onTap: handleAddMessage,
                  child: Image.asset(
                    MainAssets.submitCircle,
                    height: Dimens.dp44,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream:
              MessageService().getMessageByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.defaultMargin,
                ),
                children: snapshot.data!.map((MessageModel message) => ChatBubble(
                  isSender: message.isFromUser!,
                  text: message.message!,
                  product: message.product!,
                )).toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }

    return Scaffold(
      backgroundColor: AppColors.bgColor3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
