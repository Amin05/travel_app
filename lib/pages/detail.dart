import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/style/asset_name.dart';
import 'package:travel_app/style/size.dart';
import 'package:travel_app/style/theme.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.h(60)),
                imageSection(context),
                SizedBox(height: context.h(16)),
                descriptionSection(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget imageSection(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: context.w(24)),
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.only(top: context.h(25)),
          width: context.w(245),
          height: context.h(377),
          decoration: BoxDecoration(
            color: Color(0xff000000).withOpacity(0),
            boxShadow: [
              BoxShadow(
                color: Color(0xff02020B).withOpacity(0.5),
                blurRadius: 20,
                offset: Offset(0, 5), // Shadow position
              ),
            ],
          ),
        ),
        Hero(
          tag: "ContohTag",
          child: Container(
            width: context.w(327),
            height: context.h(377),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.all(
              //   Radius.circular(32),
              // ),
              image: DecorationImage(
                image: AssetImage(AssetName.image1),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff02020B).withOpacity(0.4),
                  blurRadius: 2,
                  offset: Offset(0, 2), // Shadow position
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: context.h(20),
                        left: context.w(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Material(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: context.w(48),
                                height: context.h(48),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(color: blurColor),
                                child: Container(
                                  width: context.w(24),
                                  height: context.h(24),
                                  child: ImageIcon(
                                    AssetImage(AssetName.ic_back),
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(
                        top: context.h(20),
                        right: context.w(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Material(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                width: context.w(48),
                                height: context.h(48),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(color: blurColor),
                                child: Container(
                                  width: context.w(24),
                                  height: context.w(24),
                                  child: ImageIcon(
                                    AssetImage(AssetName.ic_love),
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      context.w(20), 0, context.w(24), context.h(20)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Kanlaya's Eyrie",
                              style: GoogleFonts.dmSans(
                                  color: whiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(height: context.h(6)),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AssetName.bold_location,
                                width: context.w(16),
                                height: context.h(16),
                                color: whiteColor,
                              ),
                              SizedBox(width: context.w(4)),
                              RichText(
                                text: TextSpan(
                                  text: "Pang Mapha, Thailand",
                                  style: GoogleFonts.dmSans(
                                      color: whiteColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: context.h(4)),
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(color: whiteColor),
                                children: <TextSpan>[
                              TextSpan(
                                text: '\$100/',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: ' Night',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ])),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget descriptionSection(BuildContext context) {
  return Padding(
    padding:
        EdgeInsets.fromLTRB(context.w(24), 0, context.w(24), context.h(94)),
    child: Container(
      color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description', style: boldBlackText),
          Text(
            "Set amidst the forest and mountains of Mae Hong Son, Kanlaya's Eyrie, Luxury Homestay offers luxurious, fully serviced, villa-style accommodation, and an extensive subtropical garden.",
            style: descriptionText,
          )
        ],
      ),
    ),
  );
}
