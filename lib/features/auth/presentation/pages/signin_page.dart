import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/theme/app_palette.dart';
import 'package:todo_app/features/auth/presentation/pages/signup_page.dart';
import 'package:todo_app/features/auth/presentation/widgits/large_circle_dark.dart';
import 'package:todo_app/features/auth/presentation/widgits/large_circle_light.dart';
import 'package:todo_app/features/auth/presentation/widgits/ribbon_circle.dart';
import 'package:todo_app/features/auth/presentation/widgits/ribbon_dark.dart';
import 'package:todo_app/features/auth/presentation/widgits/small_circle_dark.dart';
import 'package:todo_app/features/auth/presentation/widgits/auth_default_button.dart';
import 'package:todo_app/features/auth/presentation/widgits/small_circle_light.dart';

import '../widgits/auth_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: Stack(
          children: [
            const SmallCircleDark(),
            const SmallCircleLight(),
            const LargeCircleDark(),
            const LargeCircleLight(),
            const RibbonDark(),
            const RibbonCircle(),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Sign In.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50, color: AppPalette.buttonColor),),
                  const Text("Let's sign you in with your existing account", style: TextStyle(color: AppPalette.buttonColor, fontSize: 13)),
                  const SizedBox(height: 20,),
                  AuthField(hintText: 'Email', controller: emailController, isObscureText: false,),
                  const SizedBox(height: 15,),
                  AuthField(hintText: 'Password', controller: passwordController, isObscureText: true,),
                  const SizedBox(height: 20,),
                  AuthDefaultButton(text: 'Sign In', onPressed: (){

                    }
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      Get.to(() => const SignUpPage());
                    },
                    child: RichText(text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: const TextStyle(color: AppPalette.buttonColor),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: AppPalette.greenColor,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ]
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
