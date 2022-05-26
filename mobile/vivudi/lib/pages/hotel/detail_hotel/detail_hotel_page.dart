import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:vivudi/config/constant.dart';
import 'package:vivudi/pages/hotel/detail_hotel/detail_hotel_bloc.dart';

import '../../../model/hotel/hotel.dart';
import '../../../resources/app_color.dart';
import '../../../utils/dialog.dart';

class DetailHotel extends StatelessWidget {
  final String hotelId;
  const DetailHotel({Key? key, required this.hotelId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailHotelBloc bloc = DetailHotelBloc();
    bloc.getRoomById(hotelId);
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.whiteColor,
          leading: IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.angleLeft,
              color: AppColors.blackColor,
            ),
            onPressed: () => bloc.back(),
          )),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                showConfirmDialog(
                  context,
                  title: const Text(
                    'Are you sure delete \nthis post',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  onPositive: () => bloc.delete(hotelId),
                  positive: const Text(
                    'Delete',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  negative: const Text(
                    'Cancel',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                minimumSize: const Size(120.0, 40.0),
                primary: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: const BorderSide(color: AppColors.primaryColor),
                ),
              ),
              child: const Text(
                'Delete',
                style: TextStyle(color: AppColors.primaryColor, fontSize: 15),
              ),
            ),
            ElevatedButton(
              onPressed: () => bloc.edit(hotelId),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                minimumSize: const Size(120.0, 40.0),
                primary: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: const BorderSide(color: AppColors.primaryColor),
                ),
              ),
              child: const Text(
                'Edit',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: bloc.hotel.stream,
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            Hotel hotel = (snapshot.data! as Hotel);
            return Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 0,
                    child: Ink.image(
                      image: NetworkImage(
                          Constant.baseUrl + Constant.getImge + hotel.image),
                      width: double.infinity,
                      height: 240,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    hotel.roomType,
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.locationDot,
                        color: AppColors.subTextColor,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      const SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        hotel.address,
                        style: const TextStyle(
                          color: AppColors.subTextColor,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    color: AppColors.greyColor,
                    thickness: 1,
                    height: 30.0,
                  ),
                  Text(
                    '${hotel.numberBedrooms} ${hotel.numberBedrooms > 1 ? 'beds' : 'bed'} • ${hotel.numberBathrooms} ${hotel.numberBathrooms > 1 ? 'baths' : 'bath'}',
                    style: const TextStyle(
                        color: AppColors.textColor, fontSize: 18),
                  ),
                  const Divider(
                    color: AppColors.greyColor,
                    thickness: 1,
                    height: 30.0,
                  ),
                  Expanded(
                    child: SizedBox(
                      child: ReadMoreText(
                        hotel.description,
                        style: const TextStyle(
                            color: AppColors.textColor, fontSize: 18),
                        moreStyle:
                            const TextStyle(color: AppColors.primaryColor),
                        colorClickableText: Colors.black,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Read more',
                        trimExpandedText: 'Show less',
                      ),
                    ),
                  ),
                  const Divider(
                    color: AppColors.greyColor,
                    thickness: 1,
                    height: 30.0,
                  ),
                  const Text(
                    'Facilities',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var index = 0; index < 4; index++)
                        if (hotel.amenities.elementAt(index)) facility(index),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget facility(int index) {
    switch (index) {
      case 0:
        return Column(
          children: const [
            FaIcon(FontAwesomeIcons.car),
            Text(
              'Parking',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        );
      case 1:
        return Column(
          children: const [
            FaIcon(FontAwesomeIcons.utensils),
            Text(
              'Restaurant',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        );
      case 2:
        return Column(
          children: const [
            FaIcon(FontAwesomeIcons.wifi),
            Text(
              'Parking',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        );
      default:
        return Column(
          children: const [
            FaIcon(FontAwesomeIcons.ellipsis),
            Text(
              'More',
              style: TextStyle(fontSize: 13.0),
            ),
          ],
        );
    }
  }
}
