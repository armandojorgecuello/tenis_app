import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app_tennis/dependency_injector.dart';
import 'package:app_tennis/ui/utils/tennis_court.dart';

part 'welcome_viewmodel.g.dart';

@riverpod
class WelcomeViewmodel extends _$WelcomeViewmodel {
  @override
  void build() {
    ref
        .read(insertTennisCourtUsecaseProvider)
        .insertTennisCourts(courts: tennisCourts);
  }
}
