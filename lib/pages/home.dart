import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/style/asset_name.dart';
import 'package:travel_app/style/theme.dart';
import 'package:travel_app/style/size.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffFFFFFF),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBarSection(context),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget appBarSection(BuildContext context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(24, 50, 24, 0),
    child: Container(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              AssetName.imgProfile,
              width: context.w(48),
              height: context.h(48),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: context.w(13)),
            child: RichText(
                text: TextSpan(
                    style: TextStyle(
                        height: 1.2,
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                    children: <TextSpan>[
                  TextSpan(
                      text: 'Welcome\n',
                      style: TextStyle(color: Color(0xff8D8D8D))),
                  TextSpan(
                    text: 'Ghaleb Yera',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ])),
          ),
          Spacer(),
          Container(
            width: context.w(48),
            height: context.h(48),
            decoration: BoxDecoration(
              color: greyBg,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Material(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        AssetName.ic_notif,
                        width: context.w(24),
                        height: context.h(24),
                      ),
                    ),
                    Positioned(
                      top: context.h(14),
                      right: context.h(16),
                      child: Container(
                        width: context.w(6),
                        height: context.h(6),
                        decoration: BoxDecoration(
                          color: Color(0xffFF480A),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
