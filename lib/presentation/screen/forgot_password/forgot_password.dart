import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:ecommerce_app/presentation/router/AppRouter.gr.dart';
import 'package:ecommerce_app/presentation/screen/forgot_password/forgot_password_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../components/head_line.dart';
import '../../components/my_button.dart';
import '../../components/text_field.dart';

@RoutePage()
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.050),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const HeadLine(titleHeadLine: "Forgot password"),
            const Gap(100),
            const TextDefault(
                color: Colors.black,
                text:
                    "Please, enter your email address. You will receive a link to create a new password via email."),
            const Gap(20),

            Form(
                key: forgotPasswordController.formKey,
                child: Column(
                  children: [
                    const Gap(10),
                    InputTextField(
                      label: "Email",
                      textEditingController:
                          forgotPasswordController.emailController,
                      validatorTextField:
                          forgotPasswordController.emailValidator1,
                      icon: Icons.clear,
                      onTapIcon: () {
                        forgotPasswordController.emailController.text = "";
                      },
                    )
                  ],
                )),
            const Gap(5),
            Obx(() => Center(
                    child: TextError(
                  text: forgotPasswordController.errorText.value,
                ))),
            const Gap(30),
            ButtonAnimation(
                width: size.width,
                height: 50,
                text: "SEND",
                onPressed: () async {
                  if (forgotPasswordController.formKey.currentState!
                      .validate()) {
                    await forgotPasswordController.sendPasswordResetEmail(
                        () => {
                              AutoRouter.of(context).pushAndPopUntil(
                                LoginRoute(),
                                predicate: (_) => false,
                              )
                            },
                        (error) => {Fluttertoast.showToast(msg: error)});
                  }
                }),

            // Text widget takes an Rx<T> variable as value, so it will work fine
          ]),
        ),
      ),
    ));
  }
}
