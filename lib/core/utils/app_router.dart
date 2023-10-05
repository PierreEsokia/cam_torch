import 'package:auto_route/auto_route.dart';
import 'package:cam_torch/features/home/presentation/pages/home_page.dart';
import 'package:cam_torch/features/images/presentation/pages/images_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          initial: true,
          path: HomePage.route,
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: ImagesPage.route,
          page: ImagesRoute.page,
        ),
      ];

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    resolver.next();
    // const bool isAuthenticated = false;
    // print(resolver.isReevaluating);
    // if (isAuthenticated || resolver.route.name == LoginRoute.name) {
    //   resolver.next();
    // } else {
    //   push(const LoginRoute());
    // }
  }
}
