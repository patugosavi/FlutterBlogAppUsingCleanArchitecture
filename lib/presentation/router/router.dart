part of 'router_imports.dart';

@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: SplashRoute.page, path: "/", initial: true),
        AutoRoute(page: OnBoardRoute.page),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: GeneralRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: TagsRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: AddPostRoute.page),
        AutoRoute(page: CategoriesRoute.page),
        AutoRoute(page: HomeDetailsRoute.page),
        AutoRoute(page: AddTagsRoute.page),
        AutoRoute(page: UpdateTagsRoute.page),
        AutoRoute(page: AddCategoriesRoute.page),
        AutoRoute(page: UpdateCategoriesRoute.page),
      ];
}
