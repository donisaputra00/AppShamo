import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shamo/resources/resources.dart';
import 'package:shamo/views/views.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    );
    
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.secondColor,
        child: Image.asset(
          MainAssets.cart,
          width: Dimens.dp20,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(Dimens.dp30),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: Dimens.dp6,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            backgroundColor: AppColors.bgColor4,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: Dimens.dp18,
                    bottom: Dimens.dp4,
                  ),
                  child: Image.asset(
                    MainAssets.home,
                    width: Dimens.dp20,
                    color: currentIndex == 0 ? AppColors.primaryColor : null,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: Dimens.dp18,
                    bottom: Dimens.dp4,
                  ),
                  child: Image.asset(
                    MainAssets.chat,
                    width: Dimens.dp20,
                    color: currentIndex == 1 ? AppColors.primaryColor : null,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: Dimens.dp18,
                    bottom: Dimens.dp4,
                  ),
                  child: Image.asset(
                    MainAssets.loveIcon,
                    width: Dimens.dp20,
                    color: currentIndex == 2 ? AppColors.primaryColor : null,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: Dimens.dp18,
                    bottom: Dimens.dp4,
                  ),
                  child: Image.asset(
                    MainAssets.profile,
                    width: Dimens.dp18,
                    color: currentIndex == 3 ? AppColors.primaryColor : null,
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const ChatPage();
        case 2:
          return const WishlistPage();
        case 3:
          return const ProfilePage();
        default:
          return const HomePage();
      }
    }

    return Scaffold(
      backgroundColor:
          currentIndex == 0 ? AppColors.bgColor1 : AppColors.bgColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: SafeArea(
        child: body(),
      ),
    );
  }
}
