import 'package:client_mob/screens/profile/login_page.dart';
import 'package:client_mob/screens/profile/register_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
 const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: Colors.orangeAccent,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Text('Login'),
              ),
              Tab(
                icon: Text('Register'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: LoginPage(),
            ),
            Center(
              child: RegisterPage(),
            ),
          ],
        ),
      ),
    );
  }
}
