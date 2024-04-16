import 'package:client_mob/main.dart';
import 'package:client_mob/models/user_model.dart';
import 'package:client_mob/services/auth_service.dart';
import 'package:client_mob/screens/profile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  labelText: 'Email',
                  textController: emailController,
                  icon: Icons.email,
                  obsecureText: false,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  labelText: 'Username',
                  textController: usernameController,
                  icon: Icons.person,
                  obsecureText: false,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  labelText: 'Password',
                  textController: passwordController,
                  icon: Icons.password,
                  obsecureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .primaryColor
                            .withAlpha(200), // Background color
                        shape: BoxShape
                            .circle, // Shape of the container (optional)
                      ),
                      child: IconButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            UserModel user = await AuthService.loginUser(
                                email: emailController.text,
                                username: usernameController.text,
                                password: passwordController.text,
                                context: context);
                            ref
                                .read(userProvider.notifier)
                                .updateUser(user.id, user.username, user.email);

                            ref.read(pageProvider.notifier).state = 0;
                          }
                        },
                        color: Colors.white,
                        iconSize: 36,
                        icon: const Icon(Icons.arrow_right_alt_rounded),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(onPressed: () {
                  AuthService.refreshToken();
                }, child: const Text('Refresh')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
