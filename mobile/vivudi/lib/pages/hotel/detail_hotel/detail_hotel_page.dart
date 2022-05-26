import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:vivudi/components/button.dart';
import 'package:vivudi/pages/hotel/detail_hotel/detail_hotel_bloc.dart';

import '../../../model/hotel/hotel.dart';
import '../../../resources/app_color.dart';

class DetailHotel extends StatelessWidget {
  final String hotelId;
  const DetailHotel({Key? key, required this.hotelId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailHotelBloc bloc = DetailHotelBloc();
    print("hotel Id: $hotelId");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Button(
              onPressed: () {},
              borderRadius: BorderRadius.circular(10.0),
              primary: AppColors.primaryColor,
              child: const Text(
                'Delete',
                style: TextStyle(color: AppColors.whiteColor),
              ),
            ),
            Button(
              onPressed: () {},
              borderRadius: BorderRadius.circular(10.0),
              primary: AppColors.whiteColor,
              child: const Text(
                'Edit',
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: bloc.getRoomById(hotelId),
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return const CircularProgressIndicator();
              case ConnectionState.done:
                Hotel hotel = (snapshot.data! as Hotel);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: (MediaQuery.of(context).size.width * 0.8) *
                          (3.0 / 4.0),
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Image.network(hotel.image),),
                    ),
                    Text(
                      hotel.roomType,
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const FaIcon(FontAwesomeIcons.locationDot),
                        const SizedBox(
                          width: 3.0,
                        ),
                        Text(
                          hotel.address,
                          style: const TextStyle(
                            color: AppColors.subTextColor,
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      color: AppColors.greyColor,
                    ),
                    Text(
                        '${hotel.numberBedrooms} ${hotel.numberBedrooms > 1 ? 'beds' : 'bed'} • ${hotel.numberBathrooms} ${hotel.numberBathrooms > 1 ? 'baths' : 'bath'}'),
                    const Divider(
                      color: AppColors.greyColor,
                    ),
                    ReadMoreText(
                      hotel.description,
                      trimLines: 3,
                      colorClickableText: AppColors.textColor,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: '...Read more',
                      trimExpandedText: 'Show less',
                    ),
                    const Divider(
                      color: AppColors.greyColor,
                    ),
                    const Text(
                      'Facilities',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        for (var index = 0; index < 4; index++)
                          Visibility(
                            visible: hotel.amenities.elementAt(index),
                            maintainSize: false,
                            child: facility(index),
                          ),
                      ],
                    ),
                  ],
                );
            }
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
            Text('Parking'),
          ],
        );
      case 1:
        return Column(
          children: const [
            FaIcon(FontAwesomeIcons.utensils),
            Text('Restaurant'),
          ],
        );
      case 2:
        return Column(
          children: const [
            FaIcon(FontAwesomeIcons.wifi),
            Text('Parking'),
          ],
        );
      default:
        return Column(
          children: const [
            FaIcon(FontAwesomeIcons.ellipsis),
            Text('More'),
          ],
        );
    }
  }
}
