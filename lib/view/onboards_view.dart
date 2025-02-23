import 'package:finalhackathon/viewmodel/onboards_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OnboardsView extends StatelessWidget {
  const OnboardsView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return ViewModelBuilder<OnboardsViewModel>.reactive(
      viewModelBuilder: () => OnboardsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.15),
                Image.asset(
                  'assets/images/onboard2.png',
                  fit: BoxFit.cover,
                ),
                SizedBox(height: screenHeight * 0.05),
                const Text(
                  'Good Food at a',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const Text(
                  'cheap price',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Text("You can eat at expensive"),
                const Text('restaurants with'),
                const Text('affordable price'),
                SizedBox(height: screenHeight * 0.02),
                SizedBox(
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () => viewModel.showLoginBottomSheet(context),
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [Color(0xFFD61355), Color(0xFFFF0000)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Container(
                        height: 55,
                        alignment: Alignment.center,
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
