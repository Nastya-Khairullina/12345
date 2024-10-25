import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/app_colors.dart';
import '../../../../../common/svg_icons.dart';
import 'buttons_product_widgets.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          assetGroup18,
          height: 90,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 10),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Select color and capacity',
            style: TextStyle(
              fontFamily: 'MarkPronormal400',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.buttonBarColor,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const ButtonsProductWidget(),
      ],
    );
  }
}