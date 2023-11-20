import 'package:ecommerce_app/app/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_bloc/home_bloc.dart';

class HomePageThird extends StatefulWidget {
  const HomePageThird({super.key, required this.homeBloc});
  final HomeBloc homeBloc;

  @override
  State<HomePageThird> createState() => _HomePageThirdState();
}

class _HomePageThirdState extends State<HomePageThird> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Column(
      children: [
        Expanded(
            child: SizedBox(
                width: size.width,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      AppAssets.imgBgViewPageThird1,
                      fit: BoxFit.fill,
                    ),
                     Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: _textCustom(
                            "New collection",  Colors.white)),
                      ),
                  ],
                ))),
        Expanded(
            child: SizedBox(
                width: size.width,
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: size.width,
                                child: Container(
                                  color: Colors.white,
                                  child:  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: _textCustom(
                                          "Summer\nsale", const Color(0xffDB3022)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: size.width,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.asset(
                                      AppAssets.imgBgViewPageThird3,
                                      fit: BoxFit.fill,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                          padding:
                                          const EdgeInsets.only(
                                              left: 15, bottom: 20),
                                          child: _textCustom(
                                              "Black", Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                    Expanded(
                        child: SizedBox(
                          width: size.width,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                AppAssets.imgBgViewPageThird2,
                                fit: BoxFit.fill,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: _textCustom(
                                    "Men’\nhoodies", Colors.white),
                              )
                            ],
                          ),
                        ))
                  ],
                ))),
      ],
    );
  }

  _textCustom(String title, Color color) =>
      Text(
        title,
        style:
        TextStyle(fontSize: 34, fontWeight: FontWeight.w700, color: color),
      );
}
