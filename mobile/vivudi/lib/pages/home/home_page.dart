import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vivudi/config/constant.dart';
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
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: [
          searchBar(bloc),
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: 180.0,
                    backgroundColor: AppColors.whiteColor,
                    floating: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'All your post\n',
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            const Text(
                              'Hosting your home to become an entrepreneur and laid down a path to financial freedom.\n',
                              softWrap: true,
                              style: TextStyle(
                                  color: AppColors.subTextColor, fontSize: 18),
                            ),
                            StreamBuilder(
                              stream: bloc.noHotels,
                              builder: (_, snapshot) {
                                if (!snapshot.hasData) {
                                  return Container();
                                } else {
                                  int noHotels = snapshot.data as int;
                                  String post = 'post';
                                  if (noHotels > 1) post = 'posts';
                                  return Text(
                                    '${noHotels.toString()} $post',
                                    style: const TextStyle(
                                        color: AppColors.subTextColor,
                                        fontSize: 18),
                                  );
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: StreamBuilder<List<Hotel>>(
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
                      padding: const EdgeInsets.only(bottom: 50.0),
                      itemCount: list.length,
                      itemBuilder: (_, index) => HotelCardView(
                        hotel: list.elementAt(index),
                        onPress: () =>
                            bloc.showDetailRoom(list.elementAt(index)),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBar(HomeBloc bloc) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: Material(
        elevation: 5.0,
        shadowColor: AppColors.subTextColor,
        borderRadius: BorderRadius.circular(40.0),
        child: TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
            cursorColor: AppColors.primaryColor,
            autofocus: false,
            decoration: InputDecoration(
              prefix: const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: FaIcon(
                    FontAwesomeIcons.mapPin,
                    color: AppColors.primaryColor,
                  )),
              isDense: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0),
                borderSide: const BorderSide(color: AppColors.subTextColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0),
                borderSide: const BorderSide(color: AppColors.subTextColor),
              ),
              hoverColor: AppColors.primaryColor,
              hintText: 'Where to go?',
            ),
          ),
          suggestionsCallback: (pattern) async {
            return await bloc.getSuggestions(pattern);
          },
          itemBuilder: (context, Hotel suggestion) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: ListTile(
                leading: Image(
                  image: NetworkImage(
                      Constant.baseUrl + Constant.getImge + suggestion.image),
                ),
                title: Text(suggestion.roomType),
              ),
            );
          },
          onSuggestionSelected: (Hotel suggestion) =>
              bloc.showDetailRoom(suggestion),
        ),
      ),
    );
  }
}
