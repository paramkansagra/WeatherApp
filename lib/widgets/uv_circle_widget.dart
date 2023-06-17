import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UVCircleWidget extends StatelessWidget {
  const UVCircleWidget({super.key, required this.uvIndex});

  final int uvIndex;

  @override
  Widget build(BuildContext context) {
    var svgFileNumber = 0;
    if (uvIndex == 0 || uvIndex == 1 || uvIndex == 2) {
      svgFileNumber = 0;
    } else if (uvIndex == 2 || uvIndex == 3) {
      svgFileNumber = 1;
    } else if (uvIndex == 4 || uvIndex == 5) {
      svgFileNumber = 2;
    } else if (uvIndex == 6 || uvIndex == 7) {
      svgFileNumber = 3;
    } else if (uvIndex == 8) {
      svgFileNumber = 4;
    } else if (uvIndex == 9) {
      svgFileNumber = 5;
    } else {
      svgFileNumber = 6;
    }

    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Text(
            "UV INDEX",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          SvgPicture.asset(
            "assets/UV/$svgFileNumber.svg",
            width: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "$uvIndex",
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
          )
        ],
      ),
    );
  }
}
