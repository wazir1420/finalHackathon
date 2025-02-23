import 'package:flutter/material.dart';

class OrderCompleteView extends StatelessWidget {
  const OrderCompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Column(
            children: [Image.asset('assets/images/finish.png')],
          ),
        ),
      ),
    );
  }
}
