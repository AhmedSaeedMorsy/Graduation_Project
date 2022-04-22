import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/modules/notifications/notifications.dart';
import 'package:h_care/modules/search/search.dart';
import 'package:h_care/shared/componant/componant.dart';

import 'package:h_care/shared/cubit/user_cubit/cubit.dart';
import 'package:h_care/shared/cubit/user_cubit/states.dart';
import 'package:h_care/shared/style/color.dart';

class HomeLayOut extends StatelessWidget {
  const HomeLayOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(

            actions: [
              IconButton(onPressed: (){
                navigatTo(context,const Notifications());
              }, icon:const Icon( Icons.notification_important_outlined,),),
              
              IconButton(onPressed: (){
                navigatTo(context, Search());
              }, icon: const Icon(Icons.search,),),
              
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
          drawer: Drawer(
              
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,

                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: const Text("Abhishek Mishra"),
                    accountEmail: const Text("abhishekm977@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: mainColor,
                      child: const Text(
                        "A",
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text("Home"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Settings"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.contacts),
                    title: const Text("Contact Us"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout_outlined),
                    title: const Text("Log Out"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              

            ),
          
          body: UserCubit.get(context)
              .bottomnavItem[UserCubit.get(context).currentIndex],
        );
      },
    );
  }
}
