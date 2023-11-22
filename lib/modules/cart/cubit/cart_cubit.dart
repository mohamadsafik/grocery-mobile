import 'package:flutter/material.dart';
import 'package:flutter_cubit/data/api/services.dart';
import 'package:flutter_cubit/engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/base/cart.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends BaseCubit<CartState> {
  CartCubit(BuildContext context) : super(context, CartState());

  @override
  Future<void> initData() async {
    final data = await ApiService.getCart(context);
    if (data.isSuccess) {
      if (data.data.isEmpty) {
        emit(state.copyWith(status: DataStateStatus.empty, err: data.message));
      } else {
        emit(state.copyWith(status: DataStateStatus.success, cart: data.data));
      }
    } else {
      emit(state.copyWith(status: DataStateStatus.success));
    }

    finishRefresh(state.status);
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();

  void updateQuantity(int idProduct, String type) async {
    int qty = 0;
    if (type == "+") {
      qty = 1;
    } else if (type == "-") {
      qty = -1;
    }
    final data = await ApiService.addToCart(context,
        idProduct: idProduct, quantity: qty);
    if (data.isSuccess) {
      initData();
    } else {
      initData();
      showError(data.message);
    }
  }

  void removeFromCart(int idCart) async {
    final data = await ApiService.removeFromCart(context, idCart: idCart);
    if (data.isSuccess) {
      initData();
    } else {
      showError(data.message);
      initData();
    }
  }

  void payment(List<Cart> cart) async {
    List<int> idCartList = cart.map((cartItem) => cartItem.idCart!).toList();
    final data = await ApiService.payment(context, idCart: idCartList);
    initData();
  }
}
