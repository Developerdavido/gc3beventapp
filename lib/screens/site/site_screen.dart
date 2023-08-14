import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gc3bapp/components/screen_widgets/empty_list_state.dart';
import 'package:gc3bapp/components/screen_widgets/title_text.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/services/router_service.dart';
import 'package:gc3bapp/view_models/site_provider.dart';
import 'package:provider/provider.dart';
import '../hotel_screen/hotel_screen_widgets/hotel_card.dart';

class SiteScreen extends StatefulWidget {
  const SiteScreen({Key? key}) : super(key: key);

  @override
  State<SiteScreen> createState() => _SiteScreenState();
}

class _SiteScreenState extends State<SiteScreen> {
  SiteProvider? siteVm;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _handleGetSites();
  }

  _handleGetSites() {
    siteVm = context.read<SiteProvider>();
    if (siteVm!.sites.isEmpty) {
      siteVm!.getAllSites();
    }
  }

  @override
  Widget build(BuildContext context) {
    siteVm = context.watch<SiteProvider>();
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Utils.verticalPadding(space: 51.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 29.w),
            child: const TopScreen(
              isBackIconVisible: true,
            ),
          ),
          Utils.verticalPadding(space: 14.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 49.w),
            child: const TitleText(
              titleText: "Site Visits",
            ),
          ),
          Utils.verticalPadding(space: 22.h),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23.w),
                  child: siteVm!.gettingSitesList
                      ? Center(
                          child: SpinKitWanderingCubes(
                            color: AppColors.primaryColor,
                            size: 50.sp,
                          ),
                        )
                      : siteVm!.sites.isEmpty
                          ? EmptyListState(
                              message: "No Sites found for you at the moment",
                            )
                          : ListView.builder(
                              itemCount: siteVm?.sites.length,
                              itemBuilder: (context, index) {
                                final site = siteVm?.sites[index];
                                return HotelCard(
                                  name: site?.name ?? "",
                                  location: "${site?.lat}, ${site?.lon}",
                                  costOrRating: site?.cost,
                                  isSite: true,
                                  image: site?.image,
                                  isFavorited: site?.isFavorite,
                                  isFull: site?.isFull(),
                                  onCardTap: () {
                                    locator<RouterService>().push(AppRoute.siteDetailRoute, args: site);
                                  },
                                  onFavoriteTap: () {
                                    setState(() {
                                      site?.isFavorite = !site.isFavorite!;
                                    });
                                  },
                                );
                              })))
        ],
      ),
    ));
  }
}
