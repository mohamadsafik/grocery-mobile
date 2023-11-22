import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/engine/engine.dart';
import 'package:flutter_cubit/modules/cart/cubit/cart_cubit.dart';
import 'package:flutter_cubit/routes/routes.dart';
import 'package:flutter_cubit/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class CartFloatingButton extends StatelessWidget {
  const CartFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return ContainerStateHandler(
          emptyOptions: EmptyOptions(
            customEmpty: FloatingCartWodget(state: state),
          ),
          loading: SizedBox(),
          status: state.status,
          child: FloatingCartWodget(state: state),
        );
      },
    );
  }
}

class FloatingCartWodget extends StatelessWidget {
  final CartState state;
  const FloatingCartWodget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      height: 60.0,
      width: 200,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: FloatingActionButton.extended(
        onPressed: () {
          context.pushNamed(RouteNames.cart);
          Navigator.pushNamed(context, RouteNames.cart).then((value) {
            cubit.refreshData();
          });
        },
        icon: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
        label: Text(
          'My Cart (${state.cart.length})',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        elevation: 2.0,
      ),
    );
  }
}
