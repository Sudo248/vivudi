import 'package:flutter/material.dart';
import 'package:vivudi/model/hotel/hotel.dart';
import 'package:vivudi/pages/home/home_bloc.dart';
import '../../components/hotel_card_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc bloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Hotel>?>(
      future: bloc.loadData(),
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        } else {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.done:
              List<Hotel> list = snapshot.data!;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, index) => HotelCardView(
                  hotel: list.elementAt(index),
                  onPress: () => bloc.showDetailRoom(list.elementAt(index)),
                ),
                
              );
          }
        }
      },
    );
  }
}
