import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vivudi/resources/app_color.dart';

class HotelFacilityPage extends StatefulWidget {
  const HotelFacilityPage({Key? key}) : super(key: key);

  @override
  State<HotelFacilityPage> createState() => _HotelFacilityPageState();
}

class _HotelFacilityPageState extends State<HotelFacilityPage> {
  final List<bool> _checkAmenities = List.generate(4, (index) => false);
  final List<String> _amenities = ['Parking', 'Restaurant', 'Wifi', 'Others'];
  final List<bool> _bedrooms = List.generate(4, (index) => false);
  final List<bool> _bathrooms = List.generate(4, (index) => false);
  double _price = 15000;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Bedrooms',
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10.0,),
          ToggleButtons(
              isSelected: _bedrooms,
            onPressed: (index){
                setState(() {
                  _bedrooms.fillRange(0, 4, false);
                  _bedrooms[index] = !_bedrooms[index];
                });
            },
            selectedColor: AppColors.whiteColor,
            fillColor: AppColors.primaryColor,
            selectedBorderColor: AppColors.primaryColor,
              children: const [
                Text('Any'),
                Text('1'),
                Text('2'),
                Text('3+'),
              ],
          ),
          const SizedBox(height: 10.0,),
          const Text(
            'Bathrooms',
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10.0,),
          ToggleButtons(
              isSelected: _bathrooms,
            onPressed: (index){
              setState(() {
                _bathrooms.fillRange(0, 4, false);
                _bathrooms[index] = !_bathrooms[index];
              });
            },
            selectedColor: AppColors.whiteColor,
            fillColor: AppColors.primaryColor,
            selectedBorderColor: AppColors.primaryColor,
              children: const [
                Text('Any'),
                Text('1'),
                Text('2'),
                Text('3+'),
              ],
          ),
          const SizedBox(height: 10.0,),
          const Text(
            'Amenities',
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 18,
            ),
          ),
          for (var index = 0; index < 4; index++)
            CheckboxListTile(
              activeColor: AppColors.primaryColor,
              checkColor: AppColors.whiteColor,
              selectedTileColor: AppColors.blackColor,
              controlAffinity: ListTileControlAffinity.trailing,
              title: Text(_amenities.elementAt(index)),
              value: _checkAmenities.elementAt(index),
              onChanged: (value) {
                setState(() {
                  _checkAmenities[index] = (value as bool);
                });
              },
            ),
          const SizedBox(height: 10.0,),
          const Text(
            'Price',
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10.0,),
          Slider(
              min: 0,
              max: 30000,
              value: _price,
              divisions: 60,
              activeColor: AppColors.primaryColor,
              label: (_price.toInt()).toString(),
              onChanged: (value) {
                setState(() {
                  _price = value;
                });
              },
          ),
        ],
      ),
    );
  }
}
