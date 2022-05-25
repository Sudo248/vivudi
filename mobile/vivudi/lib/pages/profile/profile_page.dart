import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 18.0),
      child: Column(
        children: [
          Row(
            children: const [
              Text("Menu", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
              Expanded(child: SizedBox.shrink()),
              FaIcon(FontAwesomeIcons.magnifyingGlass,),
              SizedBox(width: 15,),
              FaIcon(FontAwesomeIcons.gear)
            ],
          ),
          const SizedBox(height: 24,),
          const ListTile(
            contentPadding: EdgeInsets.all(0),
            minVerticalPadding: 0,
            leading: CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage("https://img.thuthuat123.com/uploads/2019/10/17/anh-nen-gai-xinh-viet-nam-dep-nhat_110152854.jpg",scale: 0.5) ,
            ),
            title: Text("Huyen Trang Nguyen", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            subtitle: Text("Host account", style: TextStyle(fontSize: 14),),
          ),
          const SizedBox(height: 24,),
          const ListTile(leading: FaIcon(FontAwesomeIcons.house, color: Colors.black, size: 32,), title: Text("Home", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),),
          const ListTile(leading: FaIcon(FontAwesomeIcons.circleQuestion, color: Colors.black,size: 32,), title: Text("Help & Support", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),),
          const ListTile(leading: FaIcon(FontAwesomeIcons.gear, color: Colors.black,size: 32,), title: Text("Settings & Privacy", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),),
          const ListTile(leading: FaIcon(FontAwesomeIcons.powerOff, color: Colors.black,size: 32,), title: Text("Logout", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),),
        ],
      ),
    );
  }
}
