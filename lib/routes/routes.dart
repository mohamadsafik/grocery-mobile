import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/modules/auth/login/cubit/login_cubit.dart';
import 'package:flutter_cubit/modules/auth/login/views/login.dart';
import 'package:flutter_cubit/modules/auth/register/cubit/register_cubit.dart';
import 'package:flutter_cubit/modules/auth/register/views/register.dart';
import 'package:flutter_cubit/modules/cart/cubit/cart_cubit.dart';
import 'package:flutter_cubit/modules/cart/views/cart.dart';
import 'package:flutter_cubit/modules/catalog/cubit/catalog_cubit.dart';
import 'package:flutter_cubit/modules/catalog/cubit/single_catalog_cubit.dart';
import 'package:flutter_cubit/modules/catalog/views/catalog.dart';
import 'package:flutter_cubit/modules/catalog/views/single_catalog.dart';
import 'package:flutter_cubit/widgets/components/unknown_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_cubit/widgets/widgets.dart';
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
        name: RouteNames.register,
        path: RouteNames.register,
        builder: (ctx, GoRouterState state) {
          return BlocProvider(
            create: (ctx) => RegisterCubit(ctx),
            child: const RegisterPage(),
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
        name: RouteNames.catalog,
        path: RouteNames.catalog,
        builder: (ctx, GoRouterState state) {
          return MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => CatalogCubit(context),
            ),
            BlocProvider(
              create: (context) => CartCubit(context),
            ),
          ], child: const CatalogPage());
        },
      ),
      GoRoute(
        name: RouteNames.singleCatalog,
        path: RouteNames.singleCatalog,
        builder: (ctx, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CartCubit(context),
              ),
              BlocProvider(
                create: (context) => SingleCatalogCubit(
                    context, int.parse(state.extra.toString())),
              ),
            ],
            child: SingleCatalogpage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.cart,
        path: RouteNames.cart,
        builder: (ctx, GoRouterState state) {
          return BlocProvider(
            create: (context) => CartCubit(context),
            child: CartPage(),
          );
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
