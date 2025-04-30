import 'dart:io';

import 'package:app_tennis/dependency_injector.dart';
import 'package:app_tennis/domain/routes/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_tennis/gen/assets.gen.dart';
import 'package:app_tennis/ui/screens/register/register_viewmodel.dart';
import 'package:app_tennis/ui/utils/colors.dart';
import 'package:app_tennis/ui/widgets/custom_buttom.dart';
import 'package:app_tennis/ui/widgets/custom_text_field.dart';

@RoutePage()
class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final TextEditingController completedName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  void dispose() {
    completedName.dispose();
    email.dispose();
    phoneNumber.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(registerViewmodelProvider.notifier);
    final state = ref.watch(registerViewmodelProvider);
    final appRouter = ref.read(appRouterProvider);

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          if (state.isLoading)
            Center(
              child:
                  Platform.isAndroid
                      ? const CircularProgressIndicator()
                      : const CupertinoActivityIndicator(),
            ),
          MyAssets.images.loginBackgroundHeader.image(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      RichText(
                        text: const TextSpan(
                          text: 'Registro',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColor.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 70.w,
                        child: const Divider(
                          color: AppColor.blueUnderline,
                          thickness: 2,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CustomTextField(
                        controller: completedName,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        labelString: 'Nombre y Apellido',
                        icon: Icons.person_outline,
                        validator: (value) {
                          return '';
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomTextField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        labelString: 'Email',
                        icon: Icons.email_outlined,
                        validator: (value) {
                          return '';
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomTextField(
                        controller: phoneNumber,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        labelString: 'Teléfono',
                        icon: Icons.phone_android_outlined,
                        validator: (value) {
                          return '';
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomTextField(
                        controller: password,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        obscureText: !state.showPassword,
                        labelString: 'Contraseña',
                        sufixIcon: IconButton(
                          icon:
                              !state.showPassword
                                  ? const Icon(Icons.visibility_outlined)
                                  : const Icon(Icons.visibility_off_outlined),
                          onPressed: () {
                            viewModel.showPassword();
                          },
                        ),
                        icon: Icons.email_outlined,
                        validator: (value) {
                          return '';
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomTextField(
                        controller: confirmPassword,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        obscureText: !state.showConfirmPassword,
                        labelString: 'Confirmar Contraseña',
                        sufixIcon: IconButton(
                          icon:
                              !state.showConfirmPassword
                                  ? const Icon(Icons.visibility_outlined)
                                  : const Icon(Icons.visibility_off_outlined),
                          onPressed: () {
                            viewModel.showConfirmPassword();
                          },
                        ),
                        icon: Icons.email_outlined,
                        validator: (value) {
                          return '';
                        },
                      ),
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.center,
                        child: CustomButtom(
                          onPressed: () {
                            viewModel.register(
                              completedName: completedName.text,
                              email: email.text,
                              phoneNumber: phoneNumber.text,
                              password: password.text,
                              confirmPassword: confirmPassword.text,
                              context: context,
                            );
                          },
                          buttomLabel: 'Registrar',
                          backgroundColor: AppColor.greenButton,
                          labelColor: AppColor.white,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ya tienes cuenta ',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColor.textcolor,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              appRouter.push(const LoginRoute());
                            },
                            child: Text(
                              'Iniciar Sesión',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColor.linkColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 90.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
