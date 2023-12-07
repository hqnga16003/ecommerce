import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:confetti/confetti.dart';
import 'package:ecommerce_app/app/app_assets.dart';
import 'package:ecommerce_app/presentation/components/my_button.dart';
import 'package:ecommerce_app/presentation/router/AppRouter.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

@RoutePage()
class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  final controller = ConfettiController();

  @override
  void initState() {
    controller.play();
    Future.delayed(const Duration(seconds: 3), () {
      controller.stop();
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
          body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.imgBags),
                const Gap(10),
                const Text(
                  "Success!",
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const Gap(10),
                const Text(
                  "Your order will be delivered soon.\nThank you for choosing our app!!",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                )
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: ButtonDefault(
                height: 50,
                width: size.width,
                text: "CONTINUE SHOPPING",
                onPressed: () {
                  AutoRouter.of(context)
                      .pushAndPopUntil(const MainRoute(), predicate: (_) => false);

                }),
          ),
        ),
        ConfettiWidget(
          confettiController: controller,
          shouldLoop: true,
          blastDirectionality: BlastDirectionality.explosive,
          numberOfParticles: 10,
          emissionFrequency: 0.1,
        )
      ],
    ));
  }
}
