import 'package:finalhackathon/viewmodel/product_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    return ViewModelBuilder<ProductDetailViewModel>.reactive(
        viewModelBuilder: () => ProductDetailViewModel(),
        builder: (context, child, viewModel) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(children: [
                    SizedBox(
                      height: he * 0.4,
                      child: Image.asset(
                        'assets/images/fullburger.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        top: 50,
                        left: 10,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Icon(Icons.arrow_back_ios),
                            ),
                          ),
                        ))
                  ]),
                  SizedBox(
                    height: he * 0.02,
                  ),
                  Container(
                    height: 10,
                    width: 60,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 247, 171, 197),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 239, 167, 191),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  'Popular',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 246, 170, 196),
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child:
                                        Image.asset('assets/images/Frame.png'),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      shape: BoxShape.circle),
                                  child: Center(
                                      child: Icon(
                                    Icons.favorite,
                                    color: Colors.black,
                                  )),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Chicken Burger',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Promo Pack',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star_half,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('4.8 Ratting'),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset('assets/images/bag.png'),
                            SizedBox(
                              width: 10,
                            ),
                            Text('7000+ orders'),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "In a medium bowl, add ground chicken, breadcrumbs, mayonnaise, onions, parsley, garlic, paprika, salt and pepper. Use your hands to combine all the ingredients together until blended, but don't over mix.Chicken Tomatoa Lettuse Preheat grill to medium-high heat and oil the grates. Form the mixture into 4-6 equal patties"),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: he * 0.1,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () {},
                            child: Ink(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFFD61355)),
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
                  )
                ],
              ),
            ),
          );
        });
  }
}
