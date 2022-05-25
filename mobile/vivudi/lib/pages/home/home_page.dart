import 'package:flutter/material.dart';
import 'package:vivudi/model/hotel/hotel.dart';
import 'package:vivudi/pages/home/home_bloc.dart';
import 'package:vivudi/resources/app_color.dart';
import '../../components/hotel_card_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc bloc = HomeBloc();
  @override
  void initState() {
    bloc.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Hotel>>(
      stream: bloc.hotels.stream,
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ));
        } else {
          List<Hotel> list = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            itemCount: list.length,
            itemBuilder: (_, index) => HotelCardView(
              hotel: list.elementAt(index),
              onPress: () => bloc.showDetailRoom(list.elementAt(index)),
            ),
          );
        }
      },
    );
  }
}
