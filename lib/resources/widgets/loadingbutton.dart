import 'package:flutter/material.dart';
import 'package:shamo/resources/resources.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.dp50,
      width: double.infinity,
      margin: const EdgeInsets.only(top: Dimens.dp30),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          primary: AppColors.primaryTextColor,
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.dp50),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Dimens.dp16,
              height: Dimens.dp16,
              margin: const EdgeInsets.only(right: Dimens.dp6),
              child: const CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(
                  AppColors.primaryTextColor,
                ),
              ),
            ),
            Text(
              'Loading',
              style: AppTextStyle.primaryTextStyle.copyWith(
                fontSize: Dimens.dp16,
                fontWeight: AppTextStyle.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
