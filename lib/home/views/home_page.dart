import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flu_anim/common/utils/my_text_style.dart';
import 'package:flu_anim/home/controllers/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/utils/my_colors.dart';

class HomePage extends GetView<HomeController> {

  final String stripePaymentUrl = "https://buy.stripe.com/test_9AQ17Ig9L2oK5Gw288"; // Replace with your actual link

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: MyColors.primaryColor, // Your background color
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 42, 8, 8),
                  child: Row(
                    children: [
                      Icon(Icons.account_circle,
                          size: 42, color: MyColors.whiteColor),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Md Altaf Hoshain",
                              style: MyTextStyle.titleStyleWhite16,
                            ),
                            Text(
                              "ID:020383",
                              style: MyTextStyle.subTitleStyleWhite14,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.notifications,
                            size: 32, color: MyColors.whiteColor),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: MyColors.backgroundLight, // Your background color
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.0),
                    _buildSingleOrder(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildSingleOrder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 4),
              child: Row(
                children: [
                  Text("Recent Orders"),
                  Spacer(),
                  Text("See All Orders"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
              child: Divider(),
            ),
            InkWell(
              onTap: () async {
                openStripePayment();
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // Aligns items at the top
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: Center(
                        child: Text("P", style: MyTextStyle.titleStyle),
                      ),
                    ),
                  ),
                  SizedBox(width: 2), // Adds some space between image and text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text("10 Items",style: MyTextStyle.bodyBlackTextBold,),
                            Spacer(),
                           // Expanded(child: Text("10 Items",textAlign: TextAlign.end,)),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text("Jan 10, 2025, 10:00 am",style: MyTextStyle.bodyBlackTextNormal,),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text("Order ID:",style: MyTextStyle.bodyBlackTextNormal,),
                            SizedBox(width: 8,),

                            //Spacer(),
                            // Expanded(child: Text("10 Items",textAlign: TextAlign.end,)),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text("#2837323323",style: MyTextStyle.bodyBlackTextNormal,),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text("Amount:",style: MyTextStyle.bodyBlackTextNormal,),
                            Spacer(),
                            // Expanded(child: Text("10 Items",textAlign: TextAlign.end,)),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text("৳3347730.00",style: MyTextStyle.titleStyle,),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text("Delivery:",style: MyTextStyle.bodyBlackTextNormal,),
                            SizedBox(width: 8,),

                            //Spacer(),
                            // Expanded(child: Text("10 Items",textAlign: TextAlign.end,)),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text("Jan 30,2025 11:00 am",style: MyTextStyle.bodyBlackTextNormal,),
                            ),
                          ],
                        ),
                        // Row(
                        //   mainAxisSize: MainAxisSize.max,
                        //   children: [
                        //     Text("",style: MyTextStyle.bodyBlackTextNormal,),
                        //     Spacer(),
                        //     // Expanded(child: Text("10 Items",textAlign: TextAlign.end,)),
                        //     Padding(
                        //       padding: const EdgeInsets.only(right: 8),
                        //       child: OutlinedButton(
                        //         style: OutlinedButton.styleFrom(
                        //           foregroundColor: Colors.orange,
                        //           side: BorderSide(color: Colors.orange, width: 2),
                        //           shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(15),
                        //           ),
                        //           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        //         ),
                        //         onPressed: () {
                        //           // Button action
                        //         },
                        //         child: Text(
                        //           "Warning",
                        //           style: TextStyle(fontSize: 14),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  void openStripePayment() async {
    final Uri url = Uri.parse(stripePaymentUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication); // Opens in external browser
    } else {
      throw "Could not launch $stripePaymentUrl";
    }
  }
}
