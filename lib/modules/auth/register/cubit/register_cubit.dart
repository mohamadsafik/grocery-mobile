import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/data/services.dart';
import 'package:flutter_cubit/engine/engine.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends BaseCubit<RegisterState> {
  final formKey = GlobalKey<FormBuilderState>();
  RegisterCubit(BuildContext context) : super(context, RegisterState());

  @override
  Future<void> initData() async {
    loadingState();
    emit(state.copyWith(status: DataStateStatus.success));
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();

 void doRegister(GlobalKey<FormBuilderState> formKey) async{
   loadingState();
  final data = await ApiService.register(context, params: formKey.currentState!.value);
  if(data.isSuccess){
    context.pop();
    showSuccess(data.message);
  }else{
    showError(data.message);
    refreshData();
  }
 }
}
