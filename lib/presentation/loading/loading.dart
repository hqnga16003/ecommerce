import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

@RoutePage()
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
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
