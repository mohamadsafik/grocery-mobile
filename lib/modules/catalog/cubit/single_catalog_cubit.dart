import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/data/api/services.dart';
import 'package:flutter_cubit/data/models/base/catalog.dart';
import 'package:flutter_cubit/engine/engine.dart';
import 'package:flutter_cubit/modules/cart/cubit/cart_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_storage/get_storage.dart';

part 'single_catalog_state.dart';
part 'single_catalog_cubit.freezed.dart';

class SingleCatalogCubit extends BaseCubit<SingleCatalogState> {
  final TextEditingController countProduct = TextEditingController(text: "1");
  final int idProduct;
  SingleCatalogCubit(BuildContext context, this.idProduct)
      : super(context, SingleCatalogState());

  @override
  Future<void> initData() async {
    loadingState();
    final data = await ApiService.singleCatalog(context, id: idProduct);
    if (data.isSuccess) {
      emit(state.copyWith(status: DataStateStatus.success, product: data.data));
    } else {
      emit(state.copyWith(status: DataStateStatus.error, err: data.message));
    }
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();

  void addCountProduct(String val) {
    int product = int.parse(val);
    product++;
    countProduct.text = product.toString();
  }

  void minCountProduct(String val) {
    int product = int.parse(val);
    product--;
    countProduct.text = product.toString();
  }

  void addToCart() async {
    showLoading();
    final data = await ApiService.addToCart(context,
        idProduct: idProduct, quantity: int.parse(countProduct.text));
    dismissLoading();
    if (data.isSuccess) {
      showSuccess(data.message);
    } else {
      showError(data.message);
    }
    context.read<CartCubit>().refreshData();
    finishRefresh(state.status);
  }
}
