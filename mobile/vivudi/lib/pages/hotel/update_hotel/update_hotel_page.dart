import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vivudi/components/button.dart';
import 'package:vivudi/pages/hotel/update_hotel/update_hotel_bloc.dart';
import 'package:vivudi/resources/app_color.dart';

import '../../../components/hotel_facility_page.dart';
import '../../../components/hotel_image_page.dart';
import '../../../components/hotel_info_page.dart';

class UpdateHotelPage extends StatefulWidget {
  const UpdateHotelPage({Key? key}) : super(key: key);

  @override
  State<UpdateHotelPage> createState() => _UpdateHotelPageState();
}

class _UpdateHotelPageState extends State<UpdateHotelPage> {
  UpdateHotelBloc bloc = UpdateHotelBloc();
  int index = 0;
  final controller = PageController(
    initialPage: 0,
  );

  void _nextPage() {
    setState(() {
      index++;
      controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  void _previousPage() {
    setState(() {
      index--;
      controller.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        leading: index > 0
            ? IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  color: AppColors.blackColor,
                ),
                onPressed: () {
                  _previousPage();
                })
            : Container(),
        actions: [
          index < 2
              ? IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.chevronRight,
                    color: AppColors.blackColor,
                  ),
                  onPressed: () {
                    _nextPage();
                  },
                )
              : Container(),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          HotelImagePage(),
          HotelInfoPage(),
          HotelFacilityPage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (index > 0) {
                    _previousPage();
                  } else {
                    bloc.back();
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: const Size(120.0, 40.0),
                  primary: AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(color: AppColors.primaryColor)),
                ),
                child: Text(
                  index > 0 ? 'Back' : 'Cancel',
                  style: const TextStyle(
                      color: AppColors.primaryColor, fontSize: 18),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (index < 2) {
                    _nextPage();
                  } else {
                    bloc.update();
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: const Size(120.0, 40.0),
                  primary: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(color: AppColors.primaryColor)),
                ),
                child: Text(
                  index < 2 ? 'Next' : 'Update',
                  style: const TextStyle(
                      color: AppColors.whiteColor, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
