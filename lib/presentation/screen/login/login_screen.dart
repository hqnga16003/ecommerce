import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/app/app_assets.dart';
import 'package:ecommerce_app/presentation/components/head_line.dart';
import 'package:ecommerce_app/presentation/components/my_button.dart';
import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:ecommerce_app/presentation/components/row_navigation.dart';
import 'package:ecommerce_app/presentation/components/text_field.dart';
import 'package:ecommerce_app/presentation/router/AppRouter.gr.dart';
import 'package:ecommerce_app/presentation/screen/login/login_bloc/login_bloc.dart';
import 'package:ecommerce_app/presentation/screen/login/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/instance_manager.dart';

import '../../../app/locator/locator.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginBloc loginBloc = getIt<LoginBloc>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final FocusNode textFocusNodeEmail = FocusNode();
  final FocusNode textFocusNodePassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<LoginBloc, LoginState>(
      bloc: loginBloc,
      listener: (BuildContext context, state) async {
        if (state is LoginLoading) {
          AutoRouter.of(context).push(const Loading());
        }
        if (state is LoginSuccess) {
          Future.delayed(const Duration(seconds: 3), () {
            AutoRouter.of(context)
                .pushAndPopUntil(const MainRoute(), predicate: (_) => false);
          });
        }
        if (state is LoginFailure) {
          await AutoRouter.of(context).pop();
          Future.delayed(Duration.zero, () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      actions: [
                        TextButton(
                            onPressed: () {
                              AutoRouter.of(context).pop();
                            },
                            child: Text("Close"))
                      ],
                      title: Text("Login Failure"),
                      content: Text(state.error),
                    ));
          });
        }
      },
      child: SafeArea(
          child: Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.050),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const HeadLine(titleHeadLine: "Login"),
              const Gap(70),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Gap(10),
                      InputTextField(
                        focusNode: textFocusNodeEmail,
                        label: "Email",
                        onFieldSubmitted: (value) {
                          textFocusNodeEmail.unfocus();
                          FocusScope.of(context)
                              .requestFocus(textFocusNodePassword);
                        },
                        textEditingController: emailController,
                        validatorTextField: (value) {
                          if (value.isEmpty) {
                            return "Please enter Email";
                          }
                          return null;
                        },
                      ),
                      const Gap(10),
                      InputTextField(
                          focusNode: textFocusNodePassword,
                          label: "Password",
                          obscureText: true,
                          textEditingController: passwordController,
                          validatorTextField: (value) {
                            if (value.isEmpty) {
                              return "Please enter Password";
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            textFocusNodePassword.unfocus();
                          })
                    ],
                  )),
              const Gap(15),
              Align(
                alignment: Alignment.centerRight,
                child: RowNavigation(
                  text: "Forgot your password?",
                  onTap: () {
                    AutoRouter.of(context).push(ForgotPasswordRoute());
                  },
                ),
              ),
              const Gap(30),
              ButtonDefault(
                  width: size.width,
                  height: 50,
                  text: "LOG IN",
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      loginBloc.add(LoginWithUserNameAndPassword(
                          emailController.text, passwordController.text));
                    }
                  }),
              const Gap(160),
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
              )

              // Text widget takes an Rx<T> variable as value, so it will work fine
            ]),
          ),
        ),
      )),
    );
  }
}
