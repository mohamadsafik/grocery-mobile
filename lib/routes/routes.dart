import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/data/models/base/article.dart';
import 'package:flutter_cubit/modules/article/view/list_articles.dart';
import 'package:flutter_cubit/modules/auth/login/cubit/login_cubit.dart';
import 'package:flutter_cubit/modules/auth/login/views/login.dart';
import 'package:flutter_cubit/modules/home/views/home.dart';
import 'package:flutter_cubit/widgets/components/unknown_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_cubit/widgets/widgets.dart';

import '../modules/article/view/single_article.dart';
import '../modules/home/cubit/home_cubit.dart';
import '../modules/splash/cubit/splash_cubit.dart';
import '../modules/splash/views/splash_page.dart';

part 'route_names.dart';

class Routes implements RouterInterface {
  static final route = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: RouteNames.root,
        path: RouteNames.root,
        builder: (ctx, GoRouterState state) {
          return BlocProvider(
            create: (ctx) => SplashCubit(ctx),
            child: const SplashPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.login,
        path: RouteNames.login,
        builder: (ctx, GoRouterState state) {
          return BlocProvider(
            create: (ctx) => LoginCubit(ctx),
            child: const LoginPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.home,
        path: RouteNames.home,
        builder: (ctx, GoRouterState state) {
          return BlocProvider(
            create: (ctx) => HomeCubit(ctx),
            child: const HomePage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.listArticle,
        path: RouteNames.listArticle,
        builder: (ctx, GoRouterState state) {
          return BlocProvider(
            create: (ctx) => HomeCubit(ctx),
            child: const ListArticlePage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.singleArticle,
        path: RouteNames.singleArticle,
        builder: (ctx, GoRouterState state) {
          return SingleArticle(article: state.extra as Article);
        },
      ),
    ],
    errorBuilder: (ctx, GoRouterState state) {
      return const UnknownPage();
    },
  );

  @override
  RouteInformationParser<Object> getRouteInformationParser() =>
      route.routeInformationParser;

  @override
  RouteInformationProvider? getRouteInformationProvider() =>
      route.routeInformationProvider;

  @override
  RouterDelegate<Object> getRouterDelegate() => route.routerDelegate;
}

abstract class RouterInterface {
  RouteInformationProvider? getRouteInformationProvider();

  RouteInformationParser<Object> getRouteInformationParser();

  RouterDelegate<Object> getRouterDelegate();
}
