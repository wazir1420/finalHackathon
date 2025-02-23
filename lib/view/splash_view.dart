import 'package:finalhackathon/viewmodel/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        viewModelBuilder: () => SplashViewModel(),
        // ignore: deprecated_member_use
        onModelReady: (viewModel) {
          viewModel.navigateToWelcome(context);
        },
        builder: (context, child, viewModel) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/images/spashs.png'),
                ],
              ),
            ),
          );
        });
  }
}
