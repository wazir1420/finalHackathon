import 'package:finalhackathon/view/onboard_view.dart';
import 'package:finalhackathon/viewmodel/party_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PartyView extends StatelessWidget {
  const PartyView({super.key});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    return ViewModelBuilder<PartyViewModel>.reactive(
        viewModelBuilder: () => PartyViewModel(),
        builder: (context, child, viewModel) {
          return Scaffold(
            body: SafeArea(
              child: Stack(children: [
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
                    SizedBox(
                      height: he * 0.15,
                    ),
                    Text(
                      'Farmhouse',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: he * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Large |'),
                        Text(
                          ' \$89',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: he * 0.01,
                      ),
                    ),
                    Text('Tomato, Mozzarella, Green basil,Olives, '),
                    Text(' Bell pepper'),
                    SizedBox(
                      height: he * 0.01,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: he * 0.08,
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
                                  builder: (context) => OnboardView()));
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              colors: [Color(0xFFFF5757), Color(0xFFFFD687)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Container(
                            height: 55,
                            alignment: Alignment.center,
                            child: Text(
                              'Shop',
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
                Positioned(
                    bottom: 250, child: Image.asset('assets/images/pizza.png'))
              ]),
            ),
          );
        });
  }
}
