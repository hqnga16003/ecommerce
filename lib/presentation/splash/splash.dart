import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../router/AppRouter.gr.dart';

@RoutePage()
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if(FirebaseAuth.instance.currentUser!=null){
        AutoRouter.of(context)
            .pushAndPopUntil(const MainRoute(), predicate: (_) => false);
      }
      else{
        AutoRouter.of(context)
            .pushAndPopUntil( LoginRoute(), predicate: (_) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: LoadingAnimationWidget.discreteCircle(
                color: const Color(0xffDB3022), size: 80)));
  }
}
