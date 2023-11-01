import 'package:flutter/material.dart';
import 'package:flutter_cubit/data/models/base/article.dart';
import 'package:flutter_cubit/data/services.dart';
import 'package:flutter_cubit/engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/base/user.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit(BuildContext context) : super(context, HomeState());

  @override
  Future<void> initData({int page = 1}) async {
    loadingState();
    getData();
  }

  Future<void> getData({int page = 1, bool force = false}) async {
    loadingState(force: force);

    List<Article> dataList = state.data;
    User user = Sessions.getUser();
    final response = await ApiService.infoMedicalCheckup(context, page: page);
    if (response.status == "ok") {
      if (page == 1) dataList = [];
      dataList = dataList + response.articles!;
      DataStateStatus status = DataStateStatus.success;
      if (dataList.isEmpty) status = DataStateStatus.empty;

      emit(state.copyWith(
        user: user,
        status: status,
        data: dataList,
        canLoadMore: dataList.length < response.totalResults!,
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
}
