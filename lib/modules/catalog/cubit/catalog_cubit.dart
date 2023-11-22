import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/data/models/base/catalog.dart';
import 'package:flutter_cubit/engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/api/services.dart';

part 'catalog_state.dart';
part 'catalog_cubit.freezed.dart';

class CatalogCubit extends BaseCubit<CatalogState> {
  final TextEditingController searchTerm = TextEditingController();
  CatalogCubit(BuildContext context) : super(context, CatalogState());

  @override
  Future<void> initData({int page = 1, String search = ""}) async {
    loadingState();
    getData(search: search);
  }

  Future<void> getData(
      {int page = 1, bool force = false, String search = ""}) async {
    loadingState(force: force);

    List<Catalog> dataList = state.data;
    final response =
        await ApiService.catalog(context, page: page, search: search);
    if (response.isSuccess) {
      if (page == 1) dataList = [];
      dataList = dataList + response.data;
      DataStateStatus status = DataStateStatus.success;
      if (dataList.isEmpty) status = DataStateStatus.empty;

      emit(state.copyWith(
        status: status,
        data: dataList,
        canLoadMore: page < response.totalPage,
        page: page,
      ));
    } else {
      if (dataList.isNotEmpty) {
        emit(state.copyWith(
          status: DataStateStatus.success,
          canLoadMore: false,
        ));
      } else {
        emit(state.copyWith(
          status: DataStateStatus.error,
          canLoadMore: false,
          err: "error",
        ));
      }
    }

    finishRefresh(state.status);
  }

  @override
  void loadingState({bool force = false}) {
    if (force) {
      emit(state.copyWith(status: DataStateStatus.initial));
    } else {
      if (state.data.isNotEmpty) {
        emit(state.copyWith(status: DataStateStatus.loading));
      } else {
        emit(state.copyWith(status: DataStateStatus.initial));
      }
    }
  }

  @override
  Future<void> loadMoreData() => getData(page: state.page + 1);

  @override
  Future<void> refreshData() => initData();

  Future<void> searctProduct(String search) => initData(search: search);
}
