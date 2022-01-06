// ignore_for_file: unnecessary_statements

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/style/asset_name.dart';
import 'package:travel_app/style/size.dart';
import 'package:travel_app/style/theme.dart';

class PreviewPage extends StatefulWidget {
  PreviewPage({Key? key}) : super(key: key);

  @override
  _PreviewPageState createState() => _PreviewPageState();
}

String activeImage = AssetName.image2;

class _PreviewPageState extends State<PreviewPage> {
  final PreviewScroller previewScroller = PreviewScroller();

  @override
  void initState() {
    super.initState();
  }

  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: "ContohTag",
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(activeImage),
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
          child: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: context.h(10),
                      right: context.w(16),
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
                              update();
                              debugPrint("activeImage");
                            },
                            child: Container(
                              width: context.w(48),
                              height: context.h(48),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(color: blurColor),
                              child: Container(
                                width: context.w(24),
                                height: context.w(24),
                                child: ImageIcon(
                                  AssetImage(AssetName.ic_more),
                                  color: whiteColor,
                                ),
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
                  width: double.infinity,
                  // color: Colors.amber,
                  padding: EdgeInsets.fromLTRB(
                      context.w(20), 0, context.w(24), context.h(40)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Detail Preview",
                        style: boldWhiteText,
                      ),
                      SizedBox(
                        height: context.h(24),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: 1,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          child: previewScroller,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PreviewScroller extends StatefulWidget {
  const PreviewScroller({Key? key}) : super(key: key);

  @override
  _PreviewScrollerState createState() => _PreviewScrollerState();
}

class _PreviewScrollerState extends State<PreviewScroller> {
  @override
  void initState() {
    super.initState();
  }

  void updating() {
    setState(() {});
    debugPrint(activeImage);
  }

  @override
  Widget build(BuildContext context) {
    // nanti digunakan untuk membuat list
    // List<int> text = [1, 2, 3, 4];
    // final children = <Widget>[];
    // for (var i in text) {
    //   children.add(new Text(i.toString()));
    // }
    List<Widget> lines = [];
    // var list = List<bool>.generate(3, (int index) => false);

    List<Widget> _buildRowList() {
      lines.add(Row(children: [
        item(context, AssetName.imageF1, updating()),
        item(context, AssetName.imageF2, updating()),
        item(context, AssetName.imageF3, updating()),
        item(context, AssetName.imageF1, updating()),
        item(context, AssetName.imageF2, updating()),
        item(context, AssetName.imageF3, updating()),
      ]));

      return lines;
    }

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildRowList(),
          ),
        ),
      ),
    );
  }

  Widget item(BuildContext context, String image, void update) {
    _PreviewPageState previewPage = _PreviewPageState();
    return Container(
      margin: EdgeInsets.only(right: context.w(16)),
      width: context.w(98),
      height: context.h(98),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            onTap: () {
              activeImage = image;
              previewPage.update();
            },
          ),
        ),
      ),
    );
  }
}
