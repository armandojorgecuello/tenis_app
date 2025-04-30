import 'package:app_tennis/dependency_injector.dart';
import 'package:app_tennis/domain/routes/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_tennis/gen/assets.gen.dart';
import 'package:app_tennis/ui/screens/login/viewmodel/login_viewmodel.dart';
import 'package:app_tennis/ui/utils/colors.dart';
import 'package:app_tennis/ui/widgets/custom_buttom.dart';
import 'package:app_tennis/ui/widgets/custom_text_field.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(loginViewmodelProvider.notifier);
    final state = ref.watch(loginViewmodelProvider);
    final appRouter = ref.read(appRouterProvider);
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
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
                          text: 'Iniciar',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColor.black,
                          ),
                          children: [
                            TextSpan(
                              text: ' Sesión',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColor.black,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
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
                        title: 'Email',
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        labelString: 'usuario@gmail.com',
                        icon: Icons.email_outlined,
                        validator: (value) {
                          return '';
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomTextField(
                        title: 'Contraseña',
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
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
                        icon: Icons.lock_outlined,
                        validator: (value) {
                          return '';
                        },
                      ),
                      SizedBox(height: 20.h),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        value: state.isRememberMe,
                        title: Text(
                          'Recordar contraseña',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColor.textcolor,
                          ),
                        ),
                        onChanged: viewModel.rememberme,
                        checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "¿Olvidaste tu contraseña?",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColor.linkColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.center,
                        child: CustomButtom(
                          onPressed: () {
                            viewModel.login(
                              email: emailController.text,
                              password: passwordController.text,
                              context: context,
                            );
                          },
                          buttomLabel: 'Iniciar Sesión',
                          backgroundColor: AppColor.greenButton,
                          labelColor: AppColor.white,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '¿Aun no tienes cuenta? ',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColor.textcolor,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              appRouter.push(const RegisterRoute());
                            },
                            child: Text(
                              'Regístrate',
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
