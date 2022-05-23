import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/providers.dart';
import 'package:shamo/resources/resources.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleLogin() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: AppColors.alertColor,
            content: Text(
              'Login Failed!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        margin: const EdgeInsets.only(
          top: Dimens.defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: AppTextStyle.primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: AppTextStyle.semiBold,
              ),
            ),
            Text(
              'Sign in to continue',
              style: AppTextStyle.secondTextStyle,
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        padding: const EdgeInsets.only(top: Dimens.dp75),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: AppTextStyle.primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: AppTextStyle.medium,
              ),
            ),
            const SizedBox(
              height: Dimens.dp12,
            ),
            Container(
              height: Dimens.dp50,
              padding: const EdgeInsets.symmetric(
                horizontal: Dimens.dp16,
              ),
              decoration: BoxDecoration(
                color: AppColors.bgColor2,
                borderRadius: BorderRadius.circular(Dimens.dp25),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      MainAssets.email,
                      width: Dimens.dp17,
                    ),
                    const SizedBox(
                      width: Dimens.dp16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: emailController,
                        style: AppTextStyle.primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Email Address',
                          hintStyle: AppTextStyle.secondTextStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: const EdgeInsets.only(top: Dimens.dp20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: AppTextStyle.primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: AppTextStyle.medium,
              ),
            ),
            const SizedBox(
              height: Dimens.dp12,
            ),
            Container(
              height: Dimens.dp50,
              padding: const EdgeInsets.symmetric(
                horizontal: Dimens.dp16,
              ),
              decoration: BoxDecoration(
                color: AppColors.bgColor2,
                borderRadius: BorderRadius.circular(Dimens.dp25),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      MainAssets.password,
                      width: Dimens.dp17,
                    ),
                    const SizedBox(
                      width: Dimens.dp16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        style: AppTextStyle.primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: AppTextStyle.secondTextStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget loginButton() {
      return Container(
        height: Dimens.dp50,
        width: double.infinity,
        margin: const EdgeInsets.only(top: Dimens.dp30),
        child: TextButton(
          onPressed: handleLogin,
          style: TextButton.styleFrom(
            primary: AppColors.primaryTextColor,
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.dp50),
            ),
          ),
          child: Text(
            'Login Now',
            style: AppTextStyle.primaryTextStyle.copyWith(
              fontSize: Dimens.dp16,
              fontWeight: AppTextStyle.medium,
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: const EdgeInsets.only(bottom: Dimens.dp30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: AppTextStyle.secondTextStyle.copyWith(
                fontWeight: AppTextStyle.medium,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text(
                ' Register',
                style: AppTextStyle.purpleTextStyle.copyWith(
                  fontWeight: AppTextStyle.medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bgColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: Dimens.defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              emailInput(),
              passwordInput(),
              isLoading ? const LoadingButton() : loginButton(),
              const Spacer(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
