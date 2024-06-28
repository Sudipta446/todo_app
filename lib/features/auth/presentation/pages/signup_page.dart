import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/common/loader.dart';
import 'package:todo_app/core/theme/app_palette.dart';
import 'package:todo_app/core/utils/show_snackbar.dart';
import 'package:todo_app/features/auth/presentation/blocs/auth_bloc.dart';

import '../widgits/auth_field.dart';
import '../widgits/auth_default_button.dart';
import '../widgits/large_circle_dark.dart';
import '../widgits/large_circle_light.dart';
import '../widgits/ribbon_circle.dart';
import '../widgits/ribbon_dark.dart';
import '../widgits/small_circle_dark.dart';
import '../widgits/small_circle_light.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
      backgroundColor: AppPalette.backgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {

          if(state is AuthLoadingState){
            showCustomDialogLoading(context);
          }

          if(state is AuthErrorState){
            Get.back();
            showSnackBar(context, state.message);
          }

          if(state is AuthSuccessState){
            Get.back();
          }
        },
        builder: (context, state) {
          return Form(
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
                      const Text(
                        "Sign Up.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: AppPalette.buttonColor),
                      ),
                      const Text("Let's sign you up with your new account",
                          style: TextStyle(
                              color: AppPalette.buttonColor, fontSize: 13)),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthField(
                        hintText: 'Email',
                        controller: emailController,
                        isObscureText: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AuthField(
                        hintText: 'Password',
                        controller: passwordController,
                        isObscureText: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthDefaultButton(
                          text: 'Sign Up',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(AuthSignUp(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim()));
                            }
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: RichText(
                          text: TextSpan(
                              text: 'Already have an account? ',
                              style: const TextStyle(
                                  color: AppPalette.buttonColor),
                              children: [
                                TextSpan(
                                  text: 'Sign In',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color: AppPalette.greenColor,
                                          fontWeight: FontWeight.bold),
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
