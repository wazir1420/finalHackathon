import 'package:finalhackathon/view/onboards_view.dart';
import 'package:finalhackathon/viewmodel/onboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    return ViewModelBuilder<OnboardViewModel>.reactive(
        viewModelBuilder: () => OnboardViewModel(),
        builder: (context, child, viewModel) {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: he * 0.02,
                ),
                Image.asset('assets/images/onboard1.png'),
                SizedBox(
                  height: he * 0.05,
                ),
                Text(
                  'Select the',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  'Favorities Menu',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: he * 0.02,
                ),
                Text("Now eat well, don't leave the house,You can "),
                Text('choose your favorite food only with '),
                Text('one click'),
                SizedBox(
                  height: he * 0.02,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: he * 0.1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnboardsView()));
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [Color(0xFFD61355), Color(0xFFFF0000)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Container(
                        height: 55,
                        alignment: Alignment.center,
                        child: Text(
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
                SizedBox(
                  height: he * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Skip',
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        child: Row(
                          spacing: 10,
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  color: Colors.grey, shape: BoxShape.circle),
                            ),
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                            ),
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  color: Colors.grey, shape: BoxShape.circle),
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.red,
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
