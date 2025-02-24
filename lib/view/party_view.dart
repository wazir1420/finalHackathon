import 'package:finalhackathon/view/onboard_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:finalhackathon/viewmodel/party_view_model.dart';

class PartyView extends StatelessWidget {
  const PartyView({super.key});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;

    return ViewModelBuilder<PartyViewModel>.reactive(
      viewModelBuilder: () => PartyViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: he * 0.3,
                      child: Image.asset(
                        'assets/images/red.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: he * 0.15),
                    Text(
                      'Farmhouse',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: he * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Large |'),
                        Text(
                          ' \$89',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: he * 0.01),
                    Text('Tomato, Mozzarella, Green basil, Olives,'),
                    Text('Bell pepper'),
                    SizedBox(height: he * 0.02),
                    _buildGradientButton(context),
                  ],
                ),
                Positioned(
                  bottom: he * 0.35,
                  left: 10,
                  right: 10,
                  child: Image.asset('assets/images/pizza.png'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGradientButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [Color(0xFFFF5757), Color(0xFFFFD687)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OnboardView()),
          );
        },
        child: Center(
          child: Text(
            'Shop',
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
