import 'package:finalhackathon/view/order_complete_view.dart';
import 'package:finalhackathon/viewmodel/order_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;

    return ViewModelBuilder<OrderDetailViewModel>.reactive(
      viewModelBuilder: () => OrderDetailViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: he * 0.03),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 176, 199),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Order Details',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    itemContainerWithQuantity(context, viewModel,
                        image: 'assets/images/Menu1.png',
                        name: 'Chicken Burger',
                        company: 'Burger Factory LTD',
                        price: '15'),
                    SizedBox(height: 15),
                    itemContainer(context,
                        image: 'assets/images/Menu2.png',
                        name: 'Onion Pizza',
                        company: 'Pizza Palace',
                        price: '15'),
                    SizedBox(height: 15),
                    itemContainer(context,
                        image: 'assets/images/Menu3.png',
                        name: 'Spicy Shawarma',
                        company: 'Hot cool Spot',
                        price: '15'),
                    SizedBox(height: 50),
                    Container(
                      height: he * 0.27,
                      decoration: BoxDecoration(
                          color: const Color(0xFFD61355),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sub-Total',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  '\$${viewModel.subTotal.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Delivery Charge',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  '\$${viewModel.deliveryCharge.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Discount',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  '\$${viewModel.discount.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(height: he * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  '\$${viewModel.total.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(height: he * 0.01),
                            SizedBox(
                              width: double.infinity,
                              height: he * 0.08,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OrderCompleteView()));
                                },
                                child: Ink(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Container(
                                    height: 55,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Place My Order',
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: const Color(0xFFD61355)),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget itemContainerWithQuantity(
    BuildContext context, OrderDetailViewModel viewModel,
    {required String image,
    required String name,
    required String company,
    required String price}) {
  return Stack(
    children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            SizedBox(width: 15),
            Image.asset(image),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(company),
                Text(
                  '\$ $price',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF0000)),
                )
              ],
            ),
            Spacer(),
          ],
        ),
      ),
      Positioned(
        right: 10,
        bottom: 20,
        child: Row(
          children: [
            GestureDetector(
              onTap: () => viewModel.decrementQuantity(),
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 233, 162, 186),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Icon(
                    Icons.remove,
                    color: Color(0xFFFF0000),
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            Text('${viewModel.quantity}', style: TextStyle(fontSize: 16)),
            SizedBox(width: 5),
            GestureDetector(
              onTap: () => viewModel.incrementQuantity(),
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Color(0xFFFF0000),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}

// Widget for static item container (for other items)
Widget itemContainer(BuildContext context,
    {required String image,
    required String name,
    required String company,
    required String price}) {
  return Stack(
    children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            SizedBox(width: 15),
            Image.asset(image),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(company),
                Text(
                  '\$ $price',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF0000)),
                )
              ],
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
      Positioned(
        right: 10,
        bottom: 40,
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 233, 162, 186),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Icon(
                  Icons.remove,
                  color: Color(0xFFFF0000),
                ),
              ),
            ),
            SizedBox(width: 5),
            Text('1'),
            SizedBox(width: 5),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Color(0xFFFF0000),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
