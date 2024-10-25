import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/svg_icons.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_state.dart';
import '../widgets/Cart/cart_items_widget.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          if (state is ProductLoadedState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProductLoadedState) {
            return SingleChildScrollView(
              child: Column(
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                  Icons.arrow_back_ios_new_sharp,
                                  size: 19,
                                  color: Colors.white
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.buttonBarColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                padding: const EdgeInsets.all(10),
                                minimumSize: const Size(15, 15),
                              ),
                            ),
                            const SizedBox(width: 140),
                            const Text('Add address',
                                style: TextStyle(
                                    fontFamily: 'MarkPronormal400',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.buttonBarColor
                                )
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: SvgPicture.asset(
                                assetGeolocation,
                                color: Colors.white,
                                height: 18,
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.iconColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 10
                                  ),
                                  minimumSize: const Size(15, 16)
                              ),
                            ),
                          ]
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                            'My Cart',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'MarkPronormal700',
                                fontSize: 35,
                                fontWeight: FontWeight.w800,
                                color: AppColors.buttonBarColor
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                        height: 680,
                        width: double.maxFinite,
                        decoration: const BoxDecoration(
                            color: AppColors.buttonBarColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0)
                            )
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15, bottom: 130),
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: state.loadedProduct.length,
                                  itemBuilder: (context, index) {
                                    return CartItemsWidget(
                                      price: state.loadedProduct[index].price,
                                      images: state.loadedProduct[index].images,
                                      title: state.loadedProduct[index].title,
                                      id: state.loadedProduct[0].id,
                                    );
                                  }
                              ),
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 65
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                      'Title',
                                      style: TextStyle(
                                          fontFamily: 'MarkPronormal700',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.grey
                                      )
                                  ),
                                  Text(
                                      '\$' + state.loadedProduct[0].title.toString() + ' us',
                                      style: const TextStyle(
                                          fontFamily: 'MarkPronormal700',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white
                                      )
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 65
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                      'Title',
                                      style: TextStyle(
                                          fontFamily: 'MarkPronormal700',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.grey
                                      )
                                  ),
                                  Text(
                                      state.loadedProduct[0].title.toString(),
                                      style: const TextStyle(
                                          fontFamily: 'MarkPronormal700',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white
                                      )
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            const Expanded(child: SizedBox()),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                'Checkout',
                                style: TextStyle(
                                  fontFamily: 'MarkPronormal400',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.iconColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 13, horizontal: 115
                                ),
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                          ],
                        )
                    )
                  ]
              ),
            );
          }
          if (state is ProductErrorState) {
            return const Center(child: Text('Error getcing details'));
          }
          return const CircularProgressIndicator();
        }
        )
    );
  }
}