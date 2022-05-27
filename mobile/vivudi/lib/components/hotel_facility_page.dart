import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vivudi/config/constant.dart';
import 'package:vivudi/resources/app_color.dart';
import 'package:vivudi/utils/dialog.dart';

class HotelFacilityPage extends StatefulWidget {
  const HotelFacilityPage({Key? key}) : super(key: key);

  @override
  State<HotelFacilityPage> createState() => _HotelFacilityPageState();
}

class _HotelFacilityPageState extends State<HotelFacilityPage> {
  final List<String> amenities = ['Parking', 'Restaurant', 'Wifi', 'Others'];
  late List<bool> checkAmenities;
  late final List<bool> bedrooms;
  late final List<bool> bathrooms;
  late double price;
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  late String bathroomsNum;
  late String bedroomsNum;

  @override
  void initState() {
    bathroomsNum = Constant.numberBathrooms < 3
        ? '3'
        : Constant.numberBathrooms.toString();
    bedroomsNum =
        Constant.numberBedrooms < 3 ? '3' : Constant.numberBedrooms.toString();
    checkAmenities = Constant.amenities;
    bedrooms = List.generate(4, (index) => false);
    if (Constant.numberBedrooms < 3) {
      bedrooms[Constant.numberBedrooms] = true;
    } else {
      bedrooms[3] = true;
    }
    bathrooms = List.generate(4, (index) => false);
    if (Constant.numberBathrooms < 3) {
      bathrooms[Constant.numberBathrooms] = true;
    } else {
      bathrooms[3] = true;
    }
    price = Constant.price;
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
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                  children: [
                    const Text(
                      'Any',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const Text(
                      '1',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const Text(
                      '2',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      bedroomsNum,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.plus),
                  onPressed: () {
                    showConfirmDialog(
                      context,
                      negative: const Text('Cancel',
                          style: TextStyle(
                              fontSize: 14, color: AppColors.primaryColor)),
                      positive:
                          const Text('Submit', style: TextStyle(fontSize: 14)),
                      title: const Center(
                        child: Text(
                          'Number of \nbedrooms',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      content: TextField(
                        controller: c1,
                        maxLength: 3,
                        cursorColor: AppColors.primaryColor,
                        decoration: const InputDecoration(
                          isDense: true,
                          hoverColor: AppColors.primaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor)),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      onPositive: () {
                        setState(
                          () {
                            bedrooms.fillRange(0, 4, false);
                            bedrooms[3] = !bedrooms[3];
                            bedroomsNum = c1.text;
                            Constant.numberBedrooms = int.parse(bedroomsNum);
                          },
                        );
                      },
                    );
                  },
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Bathrooms',
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ToggleButtons(
                  isSelected: bathrooms,
                  onPressed: (index) {
                    setState(() {
                      bathrooms.fillRange(0, 4, false);
                      bathrooms[index] = !bathrooms[index];
                      Constant.numberBathrooms = index;
                    });
                  },
                  selectedColor: AppColors.whiteColor,
                  fillColor: AppColors.primaryColor,
                  selectedBorderColor: AppColors.primaryColor,
                  children: [
                    const Text(
                      'Any',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const Text(
                      '1',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const Text(
                      '2',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      bathroomsNum,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.plus),
                  onPressed: () {
                    showConfirmDialog(
                      context,
                      negative: const Text('Cancel',
                          style: TextStyle(
                              fontSize: 14, color: AppColors.primaryColor)),
                      positive:
                          const Text('Submit', style: TextStyle(fontSize: 14)),
                      title: const Center(
                        child: Text(
                          'Number of \nbathrooms',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      content: TextField(
                        controller: c2,
                        maxLength: 3,
                        cursorColor: AppColors.primaryColor,
                        decoration: const InputDecoration(
                          isDense: true,
                          hoverColor: AppColors.primaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor)),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      onPositive: () {
                        setState(
                          () {
                            bathrooms.fillRange(0, 4, false);
                            bathrooms[3] = !bathrooms[3];
                            bathroomsNum = c2.text;
                            Constant.numberBathrooms = int.parse(bathroomsNum);
                          },
                        );
                      },
                    );
                  },
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Amenities',
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            for (var index = 0; index < 4; index++)
              CheckboxListTile(
                activeColor: AppColors.primaryColor,
                checkColor: AppColors.whiteColor,
                selectedTileColor: AppColors.blackColor,
                controlAffinity: ListTileControlAffinity.trailing,
                title: Text(
                  amenities.elementAt(index),
                  style: const TextStyle(fontSize: 18),
                ),
                value: checkAmenities.elementAt(index),
                onChanged: (value) {
                  setState(() {
                    checkAmenities[index] = (value as bool);
                    Constant.amenities = checkAmenities;
                    print("UPDATE: ${Constant.amenities}");
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
                fontSize: 20,
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
                style: const TextStyle(
                    color: AppColors.subTextColor, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
