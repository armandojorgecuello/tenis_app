import 'package:app_tennis/ui/utils/colors.dart';
import 'package:app_tennis/ui/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app_tennis/dependency_injector.dart';
import 'package:app_tennis/domain/entities/login_ui_entity.dart';
import 'package:app_tennis/domain/routes/app_router.dart';

part 'login_viewmodel.g.dart';

@riverpod
class LoginViewmodel extends _$LoginViewmodel {
  @override
  LoginUiEntity build() {
    return LoginUiEntity.init();
  }

  void showPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  void rememberme(bool? value) {
    state = state.copyWith(isRememberMe: value);
  }

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    state = state.copyWith(loading: true);
    ref
        .read(loginUserUseCaseProvider)
        .login(email: email, password: password)
        .then((value) {
          if (value!['success'] == false) {
            state = state.copyWith(loading: false);
            showGeneralDialog(
              context: context,
              pageBuilder: (context, animation, secondaryAnimation) {
                return AlertDialog(
                  title: const Text('Un error ha ocurrido'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          Text(
                            value['message'],
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          const SizedBox(height: 20),
                          CustomButtom(
                            buttomLabel: 'Aceptar',
                            backgroundColor: AppColor.greenButton,
                            labelColor: AppColor.white,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
            return;
          } else {
            final user = value['user'];
            ref
                .read(getUserUseCaseProvider)
                .getUserProfile(userId: user['id'].toString())
                .then((onValue) {
                  if (onValue != null) {
                    state = state.copyWith(loading: false);
                    ref
                        .read(appRouterProvider)
                        .push(DashboardRoute(userId: user['id'].toString()));
                  }
                });
          }
        })
        .catchError((error) {
          state = state.copyWith(loading: false);
          showGeneralDialog(
            context: context,
            pageBuilder: (context, animation, secondaryAnimation) {
              return AlertDialog(
                title: const Text('Un error ha ocurrido'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Error: $error',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        const SizedBox(height: 20),
                        CustomButtom(
                          buttomLabel: 'Aceptar',
                          backgroundColor: AppColor.greenButton,
                          labelColor: AppColor.white,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
