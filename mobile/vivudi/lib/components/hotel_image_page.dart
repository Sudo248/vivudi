import 'package:flutter/material.dart';

import '../resources/app_color.dart';

class HotelImagePage extends StatefulWidget {
  final String? urlImage;

  const HotelImagePage({Key? key, this.urlImage}) : super(key: key);

  @override
  State<HotelImagePage> createState() => _HotelImagePageState();
}

class _HotelImagePageState extends State<HotelImagePage> {
  
  @override
  void initState() {
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
              onTap: () {},
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.width) * (3.0 / 4.0),
                child: widget.urlImage == null
                    ? const FittedBox(
                        fit: BoxFit.fill,
                        child: Image(
                          image: AssetImage('assets/images/emptyimage.png'),
                        ),
                      )
                    : Image.network(widget.urlImage!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
