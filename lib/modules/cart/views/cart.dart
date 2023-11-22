import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/modules/cart/cubit/cart_cubit.dart';
import 'package:flutter_cubit/themes/themes.dart';
import 'package:flutter_cubit/widgets/widgets.dart';

import '../../../engine/engine.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("My Cart"),
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return ContainerStateHandler(
              status: state.status,
              loading: const Center(
                child: CircularProgressIndicator(),
              ),
              refresherOptions: cubit.defaultRefresh,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(20),
                      itemCount: state.cart.length,
                      itemBuilder: (context, index) {
                        final product = state.cart[index];
                        return Card(
                          margin: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 80,
                                    width: 80,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: ImageLoad(
                                          imageUrl:
                                              "${Environment.baseUrl()}${product.image}",
                                          fit: BoxFit.cover,
                                          errorWidget: const Icon(
                                            Icons.error,
                                            size: 36,
                                          ),
                                        )),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(product.name ?? ""),
                                      Text(product.price
                                          .currencyFormat(symbol: "Rp. "))
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.remove,
                                      color: AppColor.appColor.primary,
                                    ),
                                    onPressed: () {
                                      if (product.quantity! > 1) {
                                        cubit.updateQuantity(
                                            product.idProduct!, "-");
                                      } else {
                                        cubit.removeFromCart(product.idCart!);
                                      }
                                    },
                                  ),
                                  Container(
                                    width: 40,
                                    child: TextField(
                                      readOnly: true,
                                      controller: TextEditingController(
                                          text: product.quantity.toString()),
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 8),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      color: AppColor.appColor.primary,
                                    ),
                                    onPressed: () {
                                      cubit.updateQuantity(
                                          product.idProduct!, "+");
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                        width: baseWidth,
                        height: 45,
                        child: ElevatedButton(
                            onPressed: () {
                              cubit.payment(state.cart);
                            },
                            child: const Text("BUY"))),
                  ),
                  const SizedBox(height: 30)
                ],
              ),
            );
          },
        ));
  }
}
