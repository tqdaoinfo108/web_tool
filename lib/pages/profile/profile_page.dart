import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../share/colors.dart';
import '../../share/text_style.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _DailyPageState();
}

class _DailyPageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 10),
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.03),
                    spreadRadius: 10,
                    blurRadius: 3,
                    // changes position of shadow
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 25, right: 20, left: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/images/logo.png"),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: (size.width - 40) * 0.6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Nguyễn Tuấn Vũ",
                                  style: textLarge20(),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: green,
                                  ),
                                  child: Text("Đã xác minh",
                                      style: textNormal(color: white)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(CupertinoIcons.eye_slash_fill,
                                    color: grey),
                                const SizedBox(width: 10),
                                Text("***********",
                                    style: textNormal(isBold: true))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text("Cài đặt", style: textLarge20()),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Container(
            margin:
                const EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.03),
                    spreadRadius: 10,
                    blurRadius: 3,
                    // changes position of shadow
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                children: [
                  ListTile(
                      leading:
                          const Icon(CupertinoIcons.creditcard, color: primary),
                      title: Text("Nộp tiền", style: textNormal()),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded,
                          color: arrowbgColor)),
                  ListTile(
                      leading: const Icon(CupertinoIcons.person_circle,
                          color: primary),
                      title: Text("Thông tin tài khoản", style: textNormal()),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded,
                          color: arrowbgColor)),
                  ListTile(
                      leading: const Icon(CupertinoIcons.phone_circle,
                          color: primary),
                      title: Text("Liên hệ", style: textNormal()),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded,
                          color: arrowbgColor)),
                  ListTile(
                      leading: const Icon(CupertinoIcons.book_circle,
                          color: primary),
                      title: Text("Câu hỏi thường gặp", style: textNormal()),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded,
                          color: arrowbgColor)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text("Lịch sử gần nhất", style: textLarge20()),
                      ],
                    )
                  ],
                ),
                Text("Xem tất cả", style: textNormal(isBold: true)),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          left: 25,
                          right: 25,
                        ),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.03),
                                spreadRadius: 10,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, right: 20, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: arrowbgColor,
                                  borderRadius: BorderRadius.circular(15),
                                  // shape: BoxShape.circle
                                ),
                                child: const Center(
                                    child: Icon(Icons.arrow_upward_sharp)),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Thanh toán tại Lữ gia",
                                        style: textLarge(),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "15:03 22/01/2024",
                                        style: textSmall(),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "Số dư ví: **********",
                                        style: textSmall(),
                                      ),
                                    ]),
                              ),
                              IntrinsicWidth(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "-200.000đ",
                                      style: textNormal(isBold: true),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          left: 25,
                          right: 25,
                        ),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.03),
                                spreadRadius: 10,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, right: 20, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: arrowbgColor,
                                  borderRadius: BorderRadius.circular(15),
                                  // shape: BoxShape.circle
                                ),
                                child: const Center(
                                    child: Icon(Icons.arrow_downward_rounded)),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nạp tiền vào từ chi nhánh Lữ gia",
                                        style: textLarge(),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "15:03 22/01/2024",
                                        style: textSmall(),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "Số dư ví: **********",
                                        style: textSmall(),
                                      ),
                                    ]),
                              ),
                              IntrinsicWidth(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "+200.000đ",
                                      style: textNormal(isBold: true),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          left: 25,
                          right: 25,
                        ),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.03),
                                spreadRadius: 10,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, right: 20, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: arrowbgColor,
                                  borderRadius: BorderRadius.circular(15),
                                  // shape: BoxShape.circle
                                ),
                                child: const Center(
                                    child: Icon(Icons.arrow_downward_rounded)),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nạp tiền vào từ chi nhánh Lữ gia",
                                        style: textLarge(),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "15:03 22/01/2024",
                                        style: textSmall(),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "Số dư ví: **********",
                                        style: textSmall(),
                                      ),
                                    ]),
                              ),
                              IntrinsicWidth(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "THẤT BẠI",
                                      style:
                                          textNormal(isBold: true, color: red),
                                    ),
                                    Text(
                                      "+200.000đ",
                                      style: textNormal(isBold: true),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
