import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gvb_charge/share/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gvb_charge/share/text_style.dart';

import '../../share/pressable.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, i) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Pressable(
                  padding: const EdgeInsets.all(20),
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(6.r),
                  backgroundColor: white,
                  onPress: () {},
                  enabled: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // RichText(
                      //   text: TextSpan(
                      //     style: xSmallTextStyle,
                      //     children: <InlineSpan>[
                      //       TextSpan(text: "111111111"),
                      //       TextSpan(text: "2222222}"),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(height: 1.0.h),
                      Text(
                        "33333333333",
                        style: mediumTextStyle,
                      ),
                      SizedBox(height: 1.0.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 0,
                              child: Icon(
                                Icons.phone,
                                color: arrowBackColor,
                                size: 5.0.w,
                              )),
                          SizedBox(width: 2.0.h),
                          Text(
                            "4444444444444444444",
                            style: smallTextStyle,
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_city,
                            color: arrowBackColor,
                            size: 5.0.w,
                          ),
                          SizedBox(width: 2.0.h),
                          Text(
                            "555" + " km",
                            style: xSmallTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  decoration: BoxDecoration(
                      color: Colors.green[400],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(2.0.h),
                        bottomLeft: Radius.circular(8),
                      ) // green shaped
                      ),
                  child: Text(
                    "-" + (100).toString() + "%",
                  ),
                ),
              )
            ],
          );
        },
        itemCount: 10);
  }
}
