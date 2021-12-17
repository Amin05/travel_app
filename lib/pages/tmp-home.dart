import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/pages/detail.dart';
import 'package:travel_app/style/asset_name.dart';
import 'package:travel_app/style/theme.dart';
import 'package:travel_app/style/size.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

List<bool> listActive = List<bool>.filled(4, false);
List<bool> navStatus = List<bool>.filled(4, false);

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    navStatus[0] = true;
  }

  void updateBool(int pos) {
    for (int i = 0; i < navStatus.length; i++) {
      navStatus[i] = false;
    }
    navStatus[pos] = true;
  }

  @override
  Widget build(BuildContext context) {
    Widget navButton(int index, String activeIcon, String inactiveIcon) {
      return Expanded(
        flex: 1,
        child: Container(
          color: navBg,
          padding: EdgeInsets.all(5),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: navBg,
              elevation: 0,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              updateBool(index);
              setState(() {});
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  navStatus[index] ? activeIcon : inactiveIcon,
                  color: navStatus[index] ? orangeColor : navInactiveColor,
                  width: navStatus[index] ? 28 : 24,
                  height: navStatus[index] ? 28 : 24,
                ),
                SizedBox(height: 1),
                Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: navStatus[index] ? true : false,
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
      );
    }

    BottomNavigationBarItem navItem(String icon, String activeIcon) {
      return BottomNavigationBarItem(
        backgroundColor: Colors.white,
        activeIcon: SvgPicture.asset(
          icon,
          color: orangeColor,
          width: 26,
          height: 26,
        ),
        icon: SvgPicture.asset(
          activeIcon,
          color: navInactiveColor,
          width: 24,
          height: 24,
        ),
        title: Text('Menu 1'),
      );
    }

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
                SizedBox(height: context.h(32)),
                searchSection(context),
                SizedBox(height: context.h(32)),
                categoriesSection(context),
                SizedBox(height: context.h(24)),
                itemSection(context),
              ],
            ),
          ),

          // membuat bottom navigation
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  context.w(24), 0, context.w(24), context.h(22)),
              child: Stack(alignment: Alignment.topCenter, children: [
                Container(
                  margin: EdgeInsets.only(top: context.h(6)),
                  width: context.w(210),
                  height: context.h(75),
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
                Container(
                  width: double.infinity,
                  height: context.h(75),
                  decoration: BoxDecoration(
                    color: navBg,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff02020B).withOpacity(0.6),
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      )
                    ],
                    // border: Border.all(color: context.borderBottomNavColor),
                    // color: context.borderBottomNavColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.w(35),
                      vertical: context.h(10),
                    ),
                    child: Container(
                        color: navBg,
                        child: Row(
                          children: [
                            navButton(
                              0,
                              AssetName.bold_home,
                              AssetName.light_home,
                            ),
                            navButton(
                              1,
                              AssetName.bold_location,
                              AssetName.light_location,
                            ),
                            navButton(
                              2,
                              AssetName.bold_calendar,
                              AssetName.light_calendar,
                            ),
                            navButton(
                              3,
                              AssetName.bold_profile,
                              AssetName.light_profile,
                            ),
                          ],
                        )),
                  ),
                ),
              ]),
            ),
          ),

          // Stack(
          //   alignment: Alignment.bottomLeft,
          //   children: [
          //     Container(
          //       padding: EdgeInsets.symmetric(horizontal: context.w(30)),
          //       height: context.h(69),
          //       decoration: BoxDecoration(
          //         color: navBg,
          //         borderRadius: BorderRadius.all(Radius.circular(16)),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.black.withOpacity(0.07),
          //             spreadRadius: 3,
          //             blurRadius: 10,
          //             offset: Offset(0, 10), // changes position of shadow
          //           )
          //         ],
          //         // border: Border.all(color: context.borderBottomNavColor),
          //         // color: context.borderBottomNavColor,
          //       ),
          //       child: ClipRRect(
          //         borderRadius: BorderRadius.all(Radius.circular(15)),
          //         child: BottomNavigationBar(
          //           backgroundColor: navBg,
          //           type: BottomNavigationBarType.fixed,
          //           elevation: 0,
          //           selectedFontSize: 2,
          //           showSelectedLabels: false,
          //           showUnselectedLabels: false,
          //           currentIndex: _currentIndex,
          //           items: [
          //             navItem(AssetName.bulk_home, AssetName.light_home),
          //             navItem(
          //                 AssetName.bulk_location, AssetName.light_location),
          //             navItem(
          //                 AssetName.bulk_calendar, AssetName.light_calendar),
          //             navItem(AssetName.bulk_profile, AssetName.light_profile),
          //           ],
          //           onTap: onTabTapped,
          //         ),
          //       ),
          //     ),
          //     Row(
          //       children: [
          //         AnimatedContainer(
          //           duration: Duration(milliseconds: 1000),
          //           width: widthCount(_currentIndex),
          //           height: 2,
          //           color: Colors.transparent,
          //           curve: Curves.fastOutSlowIn,
          //         ),
          //         Container(
          //           width: width1Menu,
          //           padding: EdgeInsets.symmetric(horizontal: width1Menu / 3),
          //           color: Colors.transparent,
          //           child: Container(
          //             width: 24,
          //             height: 2,
          //             color: orangeColor,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),

          // ),
        ],
      ),
    );
  }
}

Widget appBarSection(BuildContext context) {
  return Padding(
    padding:
        EdgeInsets.fromLTRB(context.w(24), context.h(50), context.w(24), 0),
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
                          color: orangeColor,
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

Widget searchSection(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: context.w(24)),
    child: Container(
      decoration: BoxDecoration(
        color: greyBg,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.w(10),
        vertical: context.h(6),
      ),
      child: new Row(
        children: [
          ImageIcon(
            AssetImage(AssetName.ic_search),
            color: blackColor,
            size: 24,
          ),
          SizedBox(width: context.w(12)),
          new Flexible(
            child: new TextFormField(
              // obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search Destination',
                hintStyle: TextStyle(
                  color: Color(0xff262444).withOpacity(0.4),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget categoriesSection(BuildContext context) {
  final CategoriesScroller categoriesScroller = CategoriesScroller();

  return AnimatedOpacity(
    duration: const Duration(milliseconds: 200),
    opacity: 1,
    child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        // width: size.width,
        // alignment: Alignment.topCenter,
        // height: closeTopContainer ? 0 : categoryHeight,
        child: categoriesScroller),
  );
}

//membuat slider
class CategoriesScroller extends StatefulWidget {
  const CategoriesScroller({Key? key}) : super(key: key);

  @override
  _CategoriesScrollerState createState() => _CategoriesScrollerState();
}

class _CategoriesScrollerState extends State<CategoriesScroller> {
  @override
  void initState() {
    super.initState();
    listActive[0] = true;
  }

  void updateBool(int pos) {
    for (int i = 0; i < listActive.length; i++) {
      listActive[i] = false;
    }
    listActive[pos] = true;
    // itemCategoriesScroller.createState();
  }

  @override
  Widget build(BuildContext context) {
    // nanti digunakan untuk membuat list
    // List<int> text = [1, 2, 3, 4];
    // final children = <Widget>[];
    // for (var i in text) {
    //   children.add(new Text(i.toString()));
    // }

    // var list = List<bool>.generate(3, (int index) => false);

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: context.w(24)),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              category(context, "Homestays", 0),
              category(context, "Guesthouses", 1),
              category(context, "Hotels", 2),
              category(context, "Hostels", 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget category(BuildContext context, String category, int pos) {
    return Container(
        margin: EdgeInsets.only(right: context.w(16)),
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          listActive[pos] ? FontWeight.w700 : FontWeight.w400,
                      color: listActive[pos]
                          ? blackColor.withOpacity(0.9)
                          : greyColor.withOpacity(0.9),
                    ),
                  ),
                  Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: listActive[pos] ? true : false,
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
            Positioned.fill(
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        updateBool(pos);
                        setState(() {});
                        debugPrint(pos.toString());
                      },
                    ))),
          ],
        ));
  }
}

Widget itemSection(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: context.w(24)),
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        // shadow di bawah card
        Container(
          margin: EdgeInsets.only(top: context.h(15)),
          width: context.w(245),
          height: context.h(401),
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
        // isi card / item
        Container(
          width: context.w(327),
          height: context.h(401),
          child: Stack(
            children: [
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailPage()),
                ),
                child: Hero(
                  tag: "ContohTag",
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32),
                      ),
                      image: DecorationImage(
                        image: AssetImage(AssetName.image1),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff02020B).withOpacity(0.6),
                          blurRadius: 5,
                          offset: Offset(0, 3), // Shadow position
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: context.h(16),
                        right: context.w(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        child: BackdropFilter(
                          filter:
                              ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
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
                            Text(
                              "Kanlaya's Eyrie",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: whiteColor,
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AssetName.bold_location,
                                  width: context.w(16),
                                  height: context.h(16),
                                  color: whiteColor,
                                ),
                                SizedBox(width: context.w(4)),
                                Text(
                                  "Pang Mapha, Thailand",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: whiteColor,
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
            ],
          ),
        ),
      ],
    ),
  );
}
