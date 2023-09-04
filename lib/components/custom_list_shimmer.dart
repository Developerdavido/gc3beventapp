import 'package:flutter/material.dart';
import 'package:gc3bapp/components/shimmer.dart';

class CustomListShimmer extends StatelessWidget {
  final bool? conferenceList;
  const CustomListShimmer({Key? key, this.conferenceList = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 6,
          itemBuilder: (context, index){
            return conferenceList!
                ? ShimmerWidget(type: ShimmerWidgetType.list)
                : ShimmerWidget(type: ShimmerWidgetType.hotelList);
          }),
    );
  }
}
