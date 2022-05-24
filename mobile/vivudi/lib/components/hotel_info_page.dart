import 'package:flutter/material.dart';
import 'package:vivudi/resources/app_color.dart';

class HotelInfoPage extends StatefulWidget {
  const HotelInfoPage({Key? key}) : super(key: key);

  @override
  State<HotelInfoPage> createState() => _HotelInfoPageState();
}

class _HotelInfoPageState extends State<HotelInfoPage> {
  final TextEditingController roomTypeC = TextEditingController();
  final TextEditingController addressC = TextEditingController();
  final TextEditingController describeC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Room Type",
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10.0,),
          TextFormField(
            controller: roomTypeC,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Flora Pool Villa',
            ),
          ),
          const SizedBox(height: 10.0,),
          const Text(
            "Address",
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10.0,),
          TextFormField(
            controller: addressC,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Hoi An City, Vietnam',
            ),
          ),
          const SizedBox(height: 10.0,),
          const Text(
            "Describe",
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10.0,),
          TextFormField(
            controller: addressC,
            maxLines: 10,
            minLines: 10,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(

              border: OutlineInputBorder(),
              hintText:
                  'Staying at Flora villa, you will explore Hoian culture and history through our decorated details. You will feel closer with nature, a huge rice field with buffaloes and storks in your eyes...',
            ),
          ),
        ],
      ),
    );
  }
}
