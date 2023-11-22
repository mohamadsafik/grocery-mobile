import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/data/services.dart';
import 'package:flutter_cubit/engine/engine.dart';
import 'package:flutter_cubit/routes/routes.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends BaseCubit<LoginState> {
  final formKey = GlobalKey<FormBuilderState>();
  LoginCubit(BuildContext context) : super(context, const LoginState());
  @override
  Future<void> initData() async {
    loadingState();
    emit(state.copyWith(status: DataStateStatus.success));
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();

  void doLogin(GlobalKey<FormBuilderState> formKey) async {
    loadingState();
    final data = await ApiService.login(context,
        email: formKey.currentState!.value["email"],
        password: formKey.currentState!.value["password"]);
        if(data.isSuccess){
  Sessions.setUserData(
            jsonEncode(data.data))
        .then((value) => context.goNamed(RouteNames.root));
        }else{
            emit(state.copyWith(status: DataStateStatus.success));
          showError(data.message);
        }
  
    finishRefresh(state.status);
    
  }
}
