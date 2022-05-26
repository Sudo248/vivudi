import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0,top: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchBar(bloc),
          const SizedBox(
            height: 30.0,
          ),
          const Text(
            'All your post',
            style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'Hosting your home to become an entrepreneur and laid down a path to financial freedom.',
            style: TextStyle(
              color: AppColors.subTextColor,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          
          Expanded(
            child: StreamBuilder<List<Hotel>>(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    itemCount: list.length,
                    itemBuilder: (_, index) => HotelCardView(
                      hotel: list.elementAt(index),
                      onPress: () => bloc.showDetailRoom(list.elementAt(index)),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBar(HomeBloc bloc) {
    return FaIcon(FontAwesomeIcons.magnifyingGlass);
    // return TypeAheadField(
    //   textFieldConfiguration: TextFieldConfiguration(
    //     cursorColor: AppColors.selectedColor,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       isDense: true,
    //       focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(40.0),
    //         borderSide:
    //             const BorderSide(color: AppColors.primaryColor, width: 1.0),
    //       ),
    //       enabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(40.0),
    //         borderSide:
    //             const BorderSide(color: AppColors.primaryColor, width: 1.0),
    //       ),
    //       hoverColor: AppColors.primaryColor,
    //       hintText: 'Where to go?',
    //     ),
    //   ),
    //   suggestionsCallback: (pattern) async {
    //     // return await bloc.getSuggestions(pattern);
    //   },
    //   itemBuilder: (context, Titles suggestion) {
    //     return ListTile(
    //       leading: const FaIcon(FontAwesomeIcons.book),
    //       title: Text(suggestion.name),
    //     );
    //   },
    //   onSuggestionSelected: (Titles suggestion) =>
    //       bloc.openStory(suggestion.name),
    // );
  }
}
