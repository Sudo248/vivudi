import 'package:flutter/material.dart';

import '../model/hotel/hotel.dart';
import '../resources/app_color.dart';

class HotelCardView extends StatelessWidget {
  final Hotel hotel;
  final VoidCallback onPress;
  const HotelCardView({Key? key, required this.hotel, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        elevation: 1.0,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8 * (3.0 / 4.0),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Image.network(hotel.image),
              ),
            ),
            Text(
              hotel.roomType,
              style: const TextStyle(
                color: AppColors.textColor,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              hotel.address,
              style: const TextStyle(
                color: AppColors.subTextColor,
                fontSize: 10,
              ),
            ),
            Text(
              "\$${hotel.price}/night",
              style: const TextStyle(
                color: AppColors.textColor,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
