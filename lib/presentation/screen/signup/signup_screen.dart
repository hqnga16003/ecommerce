import 'package:async_button/async_button.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/app/FrameSize.dart';
import 'package:ecommerce_app/app/app_assets.dart';
import 'package:ecommerce_app/app/app_colors.dart';
import 'package:ecommerce_app/presentation/components/head_line.dart';
import 'package:ecommerce_app/presentation/components/my_button.dart';
import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:ecommerce_app/presentation/components/row_navigation.dart';
import 'package:ecommerce_app/presentation/components/text_field.dart';
import 'package:ecommerce_app/presentation/router/AppRouter.gr.dart';
import 'package:ecommerce_app/presentation/screen/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(FrameSize.padding),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const HeadLine(titleHeadLine: "Sign up"),
            const Gap(70),
            Form(
                key: signUpController.formKey,
                child: Column(
                  children: [
                    InputTextField(
                      focusNode: signUpController.textFocusNodeName,
                      label: "Name",
                      textEditingController: signUpController.nameController,
                      onFieldSubmitted: (value) {
                        signUpController.textFocusNodeName.unfocus();
                        FocusScope.of(context)
                            .requestFocus(signUpController.textFocusNodeEmail);
                      },
                      validatorTextField: signUpController.nameValidator,
                    ),
                    const Gap(10),
                    InputTextField(
                      focusNode: signUpController.textFocusNodeEmail,
                      label: "Email",
                      onFieldSubmitted: (value) {
                        signUpController.textFocusNodeEmail.unfocus();
                        FocusScope.of(context).requestFocus(
                            signUpController.textFocusNodePassword);
                      },
                      textEditingController: signUpController.emailController,
                      validatorTextField: signUpController.emailValidator,
                    ),
                    const Gap(10),
                    InputTextField(
                        focusNode: signUpController.textFocusNodePassword,
                        label: "Password",
                        obscureText: true,
                        textEditingController:
                            signUpController.passwordController,
                        validatorTextField: signUpController.passwordValidator,
                        onFieldSubmitted: (value) {
                          signUpController.textFocusNodePassword.unfocus();
                        })
                  ],
                )),
            const Gap(15),
            Align(
              alignment: Alignment.centerRight,
              child: RowNavigation(
                text: "Already have an account?",
                onTap: () {
                  AutoRouter.of(context).push(LoginRoute());
                },
              ),
            ),
            const Gap(30),
            ButtonDefault(
                width: size.width,
                height: 50,
                text: "SIGN UP",
                onPressed: () async {
                  if (signUpController.formKey.currentState!.validate()) {
                    await signUpController.signUp(
                        () => {
                              AutoRouter.of(context).pushAndPopUntil(
                                LoginRoute(),
                                predicate: (_) => false,
                              )
                            },
                        (error) => {Fluttertoast.showToast(msg: error)});
                  }
                }),
            const Gap(100),
            const Center(
                child: TextDefault(
                    color: Colors.black,
                    text: "Or sign up with social account")),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonLoginOther(
                  img: AppAssets.icGoogle,
                  width: 90,
                  height: 70,
                  onPressed: () {},
                ),
                const Gap(20),
                ButtonLoginOther(
                  img: AppAssets.icFacebook,
                  width: 90,
                  height: 70,
                  onPressed: () {},
                ),
              ],
            ),
            // Text widget takes an Rx<T> variable as value, so it will work fine
          ]),
        ),
      ),
    ));
  }
}
