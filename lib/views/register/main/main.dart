import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/providers.dart';
import 'package:shamo/resources/resources.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleRegister() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.register(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: AppColors.alertColor,
            content: Text(
              'Register Failed!',
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
              'Register',
              style: AppTextStyle.primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: AppTextStyle.semiBold,
              ),
            ),
            Text(
              'Register and happy shoping',
              style: AppTextStyle.secondTextStyle,
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        padding: const EdgeInsets.only(top: Dimens.dp50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
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
                      MainAssets.user,
                      width: Dimens.dp17,
                    ),
                    const SizedBox(
                      width: Dimens.dp16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
                        style: AppTextStyle.primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Full Name',
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

    Widget usernameInput() {
      return Container(
        margin: const EdgeInsets.only(top: Dimens.dp20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
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
                      MainAssets.username,
                      width: Dimens.dp17,
                    ),
                    const SizedBox(
                      width: Dimens.dp16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: usernameController,
                        style: AppTextStyle.primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Username',
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

    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(top: Dimens.dp20),
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

    Widget registerButton() {
      return Container(
        height: Dimens.dp50,
        width: double.infinity,
        margin: const EdgeInsets.only(top: Dimens.dp30),
        child: TextButton(
          onPressed: handleRegister,
          style: TextButton.styleFrom(
            primary: AppColors.primaryTextColor,
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.dp50),
            ),
          ),
          child: Text(
            'Register Now',
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
              'Already have an account?',
              style: AppTextStyle.secondTextStyle.copyWith(
                fontWeight: AppTextStyle.medium,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                ' Login',
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
              nameInput(),
              usernameInput(),
              emailInput(),
              passwordInput(),
              isLoading ? const LoadingButton() : registerButton(),
              const Spacer(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
