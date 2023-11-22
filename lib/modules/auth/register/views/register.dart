import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/engine/engine.dart';
import 'package:flutter_cubit/modules/auth/register/cubit/register_cubit.dart';
import 'package:flutter_cubit/routes/routes.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../../../../engine/helpers/form_validation.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return Scaffold(
      body: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return ContainerStateHandler(
            loading: Center(child: CircularProgressIndicator()),
            status: state.status,
            child: FormBuilder(
                key: cubit.formKey,
                child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    children: [
                      const SizedBox(height: 123),
                       Text(
                        "Register Account",
                        style: AppFont.largeBold(context)!.copyWith(fontSize: 20),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Register to create your account for using this app",
                        style: AppFont.medium(context)!.copyWith(fontSize: 14),
                      ),
                      const SizedBox(height: 50),
                      Text('Username',
                          style: AppFont.medium(context)!.copyWith(fontSize: 14)),
                      SizedBox(height: baseWidth * 0.02),
                      FormBuilderTextField(
                        onChanged: (value) {
                          cubit.formKey.currentState!.validate();
                        },
                        onTap: () {},
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                        name: 'name',
                        validator: (v) {
                          if (v != "") {
                            return null;
                          } else {
                            return 'username cant be empty';
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                  
                      Text('Email',
                          style: AppFont.medium(context)!.copyWith(fontSize: 14)),
                      SizedBox(height: baseWidth * 0.02),
                      FormBuilderTextField(
                        onChanged: (value) {
                          cubit.formKey.currentState!.validate();
                        },
                        onTap: () {},
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                        name: 'email',
                        validator: (v) {
                          if (FormValidation.isEmailValid(v ?? "")) {
                            return null;
                          } else {
                            return 'Email invalid';
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      Text('Password',
                          style: AppFont.medium(context)!.copyWith(fontSize: 14)),
                      SizedBox(height: baseWidth * 0.02),
                      FormBuilderTextField(
                        obscureText: true,
                        onChanged: (value) {
                          cubit.formKey.currentState!.validate();
                        },
                        onTap: () {},
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                        name: 'password',
                        validator: (v) {
                          if (FormValidation.isPasswordValid(v ?? "")) {
                            return null;
                          } else {
                            return "Password must be 8 characters | contain uppercase&lowercase\n"
                                "one digit (number), special character (!@)";
                          }
                        },
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 42,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6))),
                            onPressed: () {
                              if (cubit.formKey.currentState!.saveAndValidate()) {
                                cubit.doRegister(cubit.formKey);
                              } else {
                                ShowNotify.error(context,
                                    msg: "Email/password invalid");
                              }
                            },
                            child: Text("Register Account",
                                style: AppFont.whiteSmall(context)!
                                    .copyWith(fontSize: 14))),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Have Account?  ",
                            style: AppFont.medium(context),
                          ),
                          CustomButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: Text(
                              "Click Here",
                              style: AppFont.mediumPrimary(context),
                            ),
                          )
                        ],
                      )
                    ])),
          );
        },
      ),
    );
  }
}
