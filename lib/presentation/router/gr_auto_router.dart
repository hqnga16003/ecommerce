import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

class BaseNavigationScreen extends StatelessWidget {
  const BaseNavigationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}


@RoutePage()
class ShopNavigation extends BaseNavigationScreen {
  const ShopNavigation({super.key});

}

@RoutePage()
class FiltersNavigation extends BaseNavigationScreen {
  const FiltersNavigation({super.key});

}



@RoutePage()
class ProfileNavigation extends BaseNavigationScreen {
  const ProfileNavigation({super.key});

}
