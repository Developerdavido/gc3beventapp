import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/screens/feeds_and_news/feed_and_news_widget/social_media_and_feeds_card.dart';

class SocialPage extends StatefulWidget {
  const SocialPage({Key? key}) : super(key: key);

  @override
  State<SocialPage> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemCount: 4,
          itemBuilder: (context, index) {
            return SocialMediaAndFeedsCard();
          }, separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 1.5.h,
              color: AppColors.lightGrey,
            );
      },),
    );
  }
}
