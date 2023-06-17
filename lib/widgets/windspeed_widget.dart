import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WindSpeedWidget extends StatelessWidget {
  const WindSpeedWidget(
      {super.key, required this.speed, required this.direction});

  final int speed;
  final int direction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Text(
            "WIND SPEED",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 10,
          ),
          SvgPicture.asset(
            "assets/Windcompass/$direction.svg",
            width: 100,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "$speed",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 20),
              ),
              Text(
                "Km/h",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 15),
              )
            ],
          )
        ],
      ),
    );
  }
}
