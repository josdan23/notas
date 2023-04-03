import 'package:auto_route/auto_route.dart';
import 'package:notas/routes/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, path: "/"),
    AutoRoute(page: DetailRoute.page, path: "/detail")
  ];
}
