import 'package:flutter/material.dart';
import 'package:vivudi/config/constant.dart';
import 'package:vivudi/resources/app_color.dart';

class HotelFacilityPage extends StatefulWidget {
  final List<bool>? checkAmenities;
  final int? noBedrooms;
  final int? noBathrooms;
  final double? price;

  const HotelFacilityPage({
    Key? key,
    this.checkAmenities,
    this.noBathrooms,
    this.noBedrooms,
    this.price,
  }) : super(key: key);

  @override
  State<HotelFacilityPage> createState() => _HotelFacilityPageState();
}

class _HotelFacilityPageState extends State<HotelFacilityPage> {
  final List<String> amenities = ['Parking', 'Restaurant', 'Wifi', 'Others'];
  late List<bool> checkAmenities;
  late final List<bool> bedrooms;
  late final List<bool> bathrooms;
  late double price;

  @override
  void initState() {
    if (widget.checkAmenities != null) {
      checkAmenities = widget.checkAmenities!;
    } else {
      checkAmenities = List.generate(4, (index) => index == 0 ? true : false);
    }

    if (widget.noBedrooms != null) {
      bedrooms = List.generate(
          4, (index) => index == widget.noBathrooms ? true : false);
    } else {
      bedrooms = List.generate(4, (index) => index == 0 ? true : false);
    }

    if (widget.noBathrooms != null) {
      bathrooms = List.generate(
          4, (index) => index == widget.noBathrooms ? true : false);
    } else {
      bathrooms = List.generate(4, (index) => index == 0 ? true : false);
    }

    if (widget.price != null) {
      price = widget.price!;
    } else {
      price = 13000;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bedrooms',
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ToggleButtons(
              isSelected: bedrooms,
              onPressed: (index) {
                setState(() {
                  bedrooms.fillRange(0, 4, false);
                  bedrooms[index] = !bedrooms[index];
                  Constant.numberBedrooms = index;
                });
              },
              selectedColor: AppColors.whiteColor,
              fillColor: AppColors.primaryColor,
              selectedBorderColor: AppColors.primaryColor,
              children: const [
                Text(
                  'Any',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  '1',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  '2',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  '3+',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Bathrooms',
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ToggleButtons(
              isSelected: bathrooms,
              onPressed: (index) {
                setState(() {
                  bathrooms.fillRange(0, 4, false);
                  bathrooms[index] = !bathrooms[index];
                  Constant.numberBathrooms = index + 1;
                });
              },
              selectedColor: AppColors.whiteColor,
              fillColor: AppColors.primaryColor,
              selectedBorderColor: AppColors.primaryColor,
              children: const [
                Text(
                  'Any',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  '1',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  '2',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  '3+',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Amenities',
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            for (var index = 0; index < 4; index++)
              CheckboxListTile(
                activeColor: AppColors.primaryColor,
                checkColor: AppColors.whiteColor,
                selectedTileColor: AppColors.blackColor,
                controlAffinity: ListTileControlAffinity.trailing,
                title: Text(amenities.elementAt(index)),
                value: checkAmenities.elementAt(index),
                onChanged: (value) {
                  setState(() {
                    checkAmenities[index] = (value as bool);
                    Constant.amenities = checkAmenities;
                  });
                },
              ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Price',
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Slider(
              min: 0,
              max: 30000,
              value: price,
              divisions: 60,
              activeColor: AppColors.primaryColor,
              label: (price.toInt()).toString(),
              onChanged: (value) {
                setState(() {
                  price = value;
                  Constant.price = value;
                });
              },
            ),
            Center(
              child: Text(
                '\$${price.toInt()}',
                style: const TextStyle(color: AppColors.subTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
