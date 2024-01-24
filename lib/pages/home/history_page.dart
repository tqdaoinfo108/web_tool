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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Stack(
              children: [
                Pressable(
                  padding: const EdgeInsets.all(20),
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(6.r),
                  backgroundColor: white,
                  onPress: () {},
                  enabled: true,
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
                      const SizedBox(height: 10),
                      Text("Lữ gia plaza", style: mediumTextStyle),
                      const SizedBox(height: 10),
                      Text(
                          "70 Đ. Lữ Gia, Phường 15, Quận 11, Thành phố Hồ Chí Minh 70000",
                          style: smallTextStyle),
                      const SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("15:03 29/12/2023", style: xSmallTextStyle),
                          const SizedBox(width: 10),
                          const Icon(CupertinoIcons.clock,
                              size: 18, color: Color(0xFF767D88)),
                          const SizedBox(width: 4),
                          Text("30 phút", style: xSmallTextStyle),
                        ],
                      ),
                    ],
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
                      "#1029237523823",
                      style: smallTextStyle,
                    ),
                  ),
                )
              ],
            ),
          );
        },
        itemCount: 10);
  }
}
