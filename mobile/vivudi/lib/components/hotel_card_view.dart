import 'package:flutter/material.dart';
import 'package:vivudi/config/constant.dart';

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
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Card(
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 0,
                  child: Ink.image(
                    image: NetworkImage(Constant.baseUrl + Constant.getImge + hotel.image),
                    width: double.infinity,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 5.0,),
              Text(
                hotel.roomType,
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5.0,),
              Text(
                hotel.address,
                style: const TextStyle(
                  color: AppColors.subTextColor,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 5.0,),
              Text(
                "\$${hotel.price.toInt()}/night",
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
