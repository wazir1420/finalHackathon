import 'package:finalhackathon/view/order_detail_view.dart';
import 'package:finalhackathon/view/product_detail_view.dart';
import 'package:finalhackathon/view/profile_view.dart';
import 'package:finalhackathon/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    var we = MediaQuery.of(context).size.width;

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: he * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.menu),
                        Row(
                          children: [
                            Image.asset('assets/images/Frame.png'),
                            const SizedBox(width: 5),
                            const Text('Freedom way, Lekki phase'),
                          ],
                        ),
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/wazir.jpg'),
                        ),
                      ],
                    ),
                    SizedBox(height: he * 0.03),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 244, 207, 220),
                        filled: true,
                        prefixIcon: const Icon(Icons.search, size: 30),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Search',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: he * 0.03),
                    SizedBox(
                      height: 120,
                      child: PageView(
                        controller: viewModel.pageController,
                        onPageChanged: viewModel.setCurrentPage,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/p3.png',
                              fit: BoxFit.cover,
                              width: we,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/p2.jpg',
                              fit: BoxFit.cover,
                              width: we,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/p1.jpg',
                              fit: BoxFit.cover,
                              width: we,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return _buildIndicator(viewModel, index);
                      }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 10,
                        children: [
                          customContainers(context,
                              image: 'assets/images/burger.png',
                              name: 'Burger',
                              color: Color(0xFFD61355),
                              bordercolor: Color(0xFFD61355),
                              width: 0),
                          customContainers(context,
                              image: 'assets/images/pizzas.png',
                              name: 'Pizza',
                              color: Colors.white,
                              bordercolor: Colors.amberAccent,
                              width: 2),
                          customContainers(context,
                              image: 'assets/images/sandwich.png',
                              name: 'SandWich',
                              color: Colors.white,
                              bordercolor: Colors.amberAccent,
                              width: 2)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 5,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailView()));
                            },
                            child: customContainer(context,
                                image: 'assets/images/chicken.png',
                                name: 'Chicken Burger',
                                pcs: '100 gram chicken',
                                price: '20.00',
                                ratting: '3.8'),
                          ),
                          customContainer(context,
                              image: 'assets/images/zinger.png',
                              name: 'Cheese Burger',
                              pcs: '100 gram chicken',
                              price: '15.00',
                              ratting: '4.5'),
                          customContainer(context,
                              image: 'assets/images/zing.png',
                              name: 'Zinger Burger',
                              pcs: '100 gram chicken',
                              price: '25.00',
                              ratting: '4.6'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular Meal Menu',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text('See all'),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              width: 1, color: Colors.grey.shade300)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(
                              'assets/images/chicken.png',
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Zinger Burger',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text('5kg box of pizza')
                            ],
                          ),
                          SizedBox(
                            width: we * 0.1,
                          ),
                          Text(
                            '\$15',
                            style: TextStyle(
                                color: Color(0xFFD61355),
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: viewModel.selectedIndex,
            selectedItemColor: const Color(0xFFD61355),
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: viewModel.selectedIndex == 0
                    ? Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 238, 186, 204),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Icon(Icons.chat),
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          viewModel.updateSelectedIndex(0);
                        },
                        icon: Icon(Icons.home,
                            color: viewModel.selectedIndex == 0
                                ? const Color(0xFFD61355)
                                : Colors.grey),
                      ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    viewModel.updateSelectedIndex(1);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfileView()));
                  },
                  icon: viewModel.selectedIndex == 1
                      ? Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 238, 186, 204),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Icon(Icons.chat),
                          ),
                        )
                      : Icon(Icons.person,
                          color: viewModel.selectedIndex == 1
                              ? const Color(0xFFD61355)
                              : Colors.grey),
                ),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    viewModel.updateSelectedIndex(2);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderDetailView()));
                  },
                  icon: viewModel.selectedIndex == 2
                      ? Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 238, 186, 204),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Icon(Icons.chat),
                          ),
                        )
                      : Icon(Icons.shopping_cart,
                          color: viewModel.selectedIndex == 2
                              ? const Color(0xFFD61355)
                              : Colors.grey),
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    viewModel.updateSelectedIndex(3);
                  },
                  icon: viewModel.selectedIndex == 3
                      ? Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 238, 186, 204),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Icon(Icons.chat),
                          ),
                        )
                      : Icon(Icons.chat,
                          color: viewModel.selectedIndex == 3
                              ? const Color(0xFFD61355)
                              : Colors.grey),
                ),
                label: 'Chat',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIndicator(HomeViewModel viewModel, int index) {
    bool isActive = viewModel.currentPage == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.red : Colors.grey,
        borderRadius: BorderRadius.circular(isActive ? 5 : 50),
      ),
    );
  }
}

Widget customContainer(BuildContext context,
    {required String image,
    required String name,
    required String pcs,
    required String price,
    required String ratting}) {
  var he = MediaQuery.of(context).size.height;
  var we = MediaQuery.of(context).size.width;
  return Container(
    height: he * 0.32,
    width: we * 0.45,
    decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(30)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Text(ratting),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: we * 0.3,
                height: he * 0.1,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Text(pcs),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ $price',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.red),
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget customContainers(BuildContext context,
    {required String image,
    required String name,
    required Color color,
    required Color bordercolor,
    required double width}) {
  var we = MediaQuery.of(context).size.width;
  return Container(
    height: 50,
    width: we * 0.55,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: bordercolor, width: width)),
    child: Row(
      children: [
        Image.asset(
          image,
          height: 100,
          width: 100,
        ),
        Text(
          name,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        )
      ],
    ),
  );
}
