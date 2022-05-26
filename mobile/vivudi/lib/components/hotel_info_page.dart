import 'package:flutter/material.dart';
import 'package:vivudi/config/constant.dart';
import 'package:vivudi/resources/app_color.dart';

class HotelInfoPage extends StatefulWidget {
  const HotelInfoPage({Key? key})
      : super(key: key);

  @override
  State<HotelInfoPage> createState() => _HotelInfoPageState();
}

class _HotelInfoPageState extends State<HotelInfoPage> {
  final TextEditingController roomTypeC = TextEditingController();
  final TextEditingController addressC = TextEditingController();
  final TextEditingController describeC = TextEditingController();

  @override
  void initState() {
    roomTypeC.text = Constant.roomType;
    addressC.text = Constant.address;
    describeC.text = Constant.description;
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
              "Room Type",
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: roomTypeC,
              cursorColor: AppColors.primaryColor,
              onChanged: (text) {
                Constant.roomType = text;
              },
              style: const TextStyle(fontSize: 18),
              decoration: const InputDecoration(
              
                border: OutlineInputBorder(),
                hintText: 'Flora Pool Villa',
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.primaryColor, width: 2.0),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "Address",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: addressC,
              style: const TextStyle(fontSize: 18),
              cursorColor: AppColors.primaryColor,
              onChanged: (text) {
                Constant.address = text;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Hoi An City, Vietnam',
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.primaryColor, width: 2.0),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "Describe",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: describeC,
              maxLines: 10,
              minLines: 10,
              style: const TextStyle(fontSize: 18),
              keyboardType: TextInputType.multiline,
              cursorColor: AppColors.primaryColor,
              onChanged: (text) {
                Constant.description = text;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText:
                    'Staying at Flora villa, you will explore Hoian culture and history through our decorated details. You will feel closer with nature, a huge rice field with buffaloes and storks in your eyes...',
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.primaryColor, width: 2.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
