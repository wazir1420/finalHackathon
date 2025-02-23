import 'package:finalhackathon/view/onboard_view.dart';
import 'package:finalhackathon/view/onboards_view.dart';
import 'package:finalhackathon/view/party_view.dart';
import 'package:finalhackathon/view/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: PartyView),
  MaterialRoute(page: OnboardView),
  MaterialRoute(page: OnboardsView),
  MaterialRoute(page: SplashView, initial: true)
], dependencies: [
  Singleton(classType: NavigationService),
])
class App {}
