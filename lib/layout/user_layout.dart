import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/modules/notifications/notifications.dart';
import 'package:h_care/modules/search/search.dart';
import 'package:h_care/shared/componant/componant.dart';

import 'package:h_care/shared/cubit/user_cubit/cubit.dart';
import 'package:h_care/shared/cubit/user_cubit/states.dart';
import 'package:h_care/shared/style/color.dart';

class UserHomeLayOut extends StatelessWidget {
  UserHomeLayOut({Key? key}) : super(key: key);
  final advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return AdvancedDrawer(
          backdropColor: Colors.blueGrey,
          controller: advancedDrawerController,
          animationCurve: Curves.linearToEaseOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
          
          disabledGestures: false,
          childDecoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                blurRadius: 0.5,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
            onPressed:handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
              actions: [
                IconButton(
                  onPressed: () {
                    navigatTo(context, const Notifications());
                  },
                  icon: const Icon(
                    Icons.notification_important_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    navigatTo(context, Search());
                  },
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: forthColor,
              color: mainColor,
              items: const [
                Icon(
                  Icons.home_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.category_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.medical_services_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.view_list_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.settings_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              ],
              onTap: (index) {
                UserCubit.get(context).changeIndex(index);
              },
              animationDuration: const Duration(milliseconds: 500),
            ),
            body: UserCubit.get(context)
                .bottomnavItem[UserCubit.get(context).currentIndex],
          ),
          drawer: SafeArea(
            child: Container(
              child: ListTileTheme(
                textColor: Colors.white,
                iconColor: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 128.0,
                      height: 128.0,
                      margin: const EdgeInsets.only(
                        top: 24.0,
                        bottom: 64.0,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        color: Colors.black26,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/icon.png',
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.home),
                      title: const Text('Home'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.account_circle_rounded),
                      title: const Text('Profile'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.favorite),
                      title: const Text('Favourites'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.settings),
                      title: const Text('Settings'),
                    ),
                    const Spacer(),
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white54,
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        child: const Text('Terms of Service | Privacy Policy'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        
      },
      
    );
  }
  void handleMenuButtonPressed() {
    advancedDrawerController.showDrawer();
  }
}
