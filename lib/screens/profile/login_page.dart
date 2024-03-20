import 'package:client_mob/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController email_controller = TextEditingController();
  final TextEditingController username_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              const Text('Login', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                labelText: 'Email',
                textController: email_controller,
                icon: Icons.email,
                obsecureText: false,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                labelText: 'Username',
                textController: username_controller,
                icon: Icons.person,
                obsecureText: false,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                labelText: 'Password',
                textController: password_controller,
                icon: Icons.password,
                obsecureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
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
                            // if (_formKey.currentState!.validate()) {
                              // UserModel user = await AuthService.registerUser(
                              //     email: emailController.text,
                              //     username: usernameController.text,
                              //     password: passwordController.text,
                              //     context: context);
                              // ref.read(userProvider.notifier).updateUser(
                              //     user.id, user.username, user.email);
                              
                              // ref.read(pageProvider.notifier).state = 0;
                            // }
                          },
                          color: Colors.white,
                          iconSize: 36,
                          icon: const Icon(Icons.arrow_right_alt_rounded),
                        ),
                      ),
                    ],
                  )
            ],
          ),
        ),
      ),
    );
  }
}
