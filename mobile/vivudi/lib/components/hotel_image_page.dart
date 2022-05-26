import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:vivudi/config/constant.dart';
import 'package:vivudi/service/image_service.dart';

import '../repositories/hotel_repository.dart';
import '../resources/app_color.dart';

class HotelImagePage extends StatefulWidget {
  const HotelImagePage({Key? key}) : super(key: key);

  @override
  State<HotelImagePage> createState() => _HotelImagePageState();
}

class _HotelImagePageState extends State<HotelImagePage> {
  String urlImage = '';
  @override
  void initState() {
    urlImage = Constant.image;
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
              'Browser image',
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onTap: () {
                GetIt.I<ImageService>().pickImage(ImageSource.gallery,
                    uploadImage: (image) async {
                  Constant.image =
                      await GetIt.I<HotelRepository>().uploadImage(image) ?? '';
                  setState(() {
                    urlImage = Constant.image;
                  });
                  return null;
                });
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.width) * (3.0 / 4.0),
                child: imageHolder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageHolder() {
    if (urlImage.isEmpty) {
      return const FittedBox(
        fit: BoxFit.fill,
        child: Image(
          image: AssetImage('assets/images/emptyimage.png'),
        ),
      );
    } else {
      return urlImage.startsWith('http')
          ? FittedBox(
              fit: BoxFit.fill,
              child: Image.network(urlImage),
            )
          : Image.network(Constant.baseUrl + Constant.getImge + urlImage);
    }
  }
}
