import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

@RoutePage()
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {

    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: LoadingAnimationWidget.discreteCircle(
                color: const Color(0xffDB3022), size: 80)));
  }
}
