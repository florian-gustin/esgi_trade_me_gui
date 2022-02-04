import 'package:auto_route/annotations.dart';
import 'package:trade_me_gui/pages/home.dart';
import 'package:trade_me_gui/pages/login.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    RedirectRoute(path: "/", redirectTo: "/login"),
    AutoRoute(path: "/login", page: LoginPage, initial: true),
    AutoRoute(path: "/home", page: HomePage),
  ],
)
class $AppRouter {}