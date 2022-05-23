import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/models.dart';
import 'package:shamo/providers/providers.dart';
import 'package:shamo/resources/resources.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return AppBar(
        backgroundColor: AppColors.bgColor1,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(Dimens.defaultMargin),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    MainAssets.profileCircle,
                    width: Dimens.dp64,
                  ),
                ),
                const SizedBox(
                  width: Dimens.dp16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, ${user.name}',
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
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                  },
                  child: Image.asset(
                    MainAssets.exit,
                    width: Dimens.dp20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget menuAccount(String text) {
      return Container(
        margin: const EdgeInsets.only(
          top: Dimens.dp16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: AppTextStyle.secondTextStyle,
            ),
            const Icon(
              Icons.chevron_right,
              color: AppColors.primaryTextColor,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.defaultMargin,
            vertical: Dimens.dp20,
          ),
          decoration: const BoxDecoration(
            color: AppColors.bgColor3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account',
                style: AppTextStyle.primaryTextStyle.copyWith(
                  fontSize: Dimens.dp16,
                  fontWeight: AppTextStyle.semiBold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: menuAccount('Edit Account'),
              ),
              menuAccount('Your Orders'),
              menuAccount('Help'),
              const SizedBox(
                height: Dimens.dp30,
              ),
              Text(
                'General',
                style: AppTextStyle.primaryTextStyle.copyWith(
                  fontSize: Dimens.dp16,
                  fontWeight: AppTextStyle.semiBold,
                ),
              ),
              menuAccount('Privacy & Policy'),
              menuAccount('Term of Service'),
              menuAccount('Rate App'),
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
