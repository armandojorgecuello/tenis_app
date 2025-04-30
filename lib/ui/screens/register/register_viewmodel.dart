import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app_tennis/dependency_injector.dart';
import 'package:app_tennis/domain/entities/register_ui_entity.dart';
import 'package:app_tennis/domain/routes/app_router.dart';
import 'package:app_tennis/domain/routes/exports.dart';
import 'package:app_tennis/ui/utils/colors.dart';
import 'package:app_tennis/ui/widgets/custom_buttom.dart';

part 'register_viewmodel.g.dart';

@riverpod
class RegisterViewmodel extends _$RegisterViewmodel {
  @override
  RegisterUiEntity build() {
    return RegisterUiEntity.init();
  }

  void showPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  void showConfirmPassword() {
    state = state.copyWith(showConfirmPassword: !state.showConfirmPassword);
  }

  void rememberme(bool? value) {
    state = state.copyWith(isRememberMe: value);
  }

  void register({
    required String completedName,
    required String email,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) {
    state = state.copyWith(isLoading: true);
    ref
        .read(registerUseCaseProvider)
        .registerUser(
          user: {
            'name': completedName,
            'email': email,
            'phone': phoneNumber,
            'password': password,
            'confirmPassword': confirmPassword,
          },
        )
        .then((value) {
          state = state.copyWith(isLoading: false);
          showGeneralDialog(
            context: context,
            pageBuilder: (context, animation, secondaryAnimation) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Usuario registrado con éxito'),
                    CustomButtom(
                      buttomLabel: 'Iniciar sesión',
                      onPressed: () {
                        ref.read(appRouterProvider).pop();
                        ref.read(appRouterProvider).push(const LoginRoute());
                      },
                      labelColor: AppColor.white,
                      backgroundColor: AppColor.greenButton,
                    ),
                  ],
                ),
              );
            },
          );
        })
        .catchError((error) {
          state = state.copyWith(isLoading: false);
        });
  }
}
