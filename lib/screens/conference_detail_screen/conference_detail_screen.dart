import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/screen_widgets/custom_loader.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/models/conference.dart';
import 'package:gc3bapp/models/conference_indicator.dart';
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_widget/conference_detail_title_widget.dart';
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_widget/custom_sliver_appbar_delegate.dart';
import 'package:gc3bapp/screens/conference_detail_screen/conference_detail_widget/program_item_widget.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
import 'package:provider/provider.dart';

class ConferenceDetailScreen extends StatefulWidget {
  final Conference? conference;
  const ConferenceDetailScreen({Key? key, this.conference}) : super(key: key);

  @override
  State<ConferenceDetailScreen> createState() => _ConferenceDetailScreenState();
}

class _ConferenceDetailScreenState extends State<ConferenceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final conferenceVm = Provider.of<ConferenceProvider>(context);
    final theme = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 39.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(39.r),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    //floating: false,
                    pinned: true,
                    backgroundColor: AppColors.primaryColor,
                    title: TopScreen(
                        isBackIconVisible: true,
                        isAccountIconVisible: true,
                        iconColor: AppColors.onPrimaryColor,
                        accountIcon: Container(
                          height: 24.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: AppColors.primaryColor),
                          child: Center(
                            child: Text('${widget.conference?.attendees?.length ?? 0}',
                                style: theme.textTheme.labelSmall!.copyWith(
                                  color: AppColors.onPrimaryColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                        )),
                    collapsedHeight: 322.h,
                    expandedHeight: 537.h,
                    elevation: 0,
                    clipBehavior: Clip.hardEdge,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      titlePadding: EdgeInsets.zero,
                      expandedTitleScale: 1.0,
                      background: Image.network(
                        widget.conference!.banner!,
                        fit: BoxFit.cover,
                      ),
                      title: ConferenceDetailTitleWidget(conference: widget.conference),
                    ),
                  ),
                 // _buildSliverAppbar(theme),
                  SliverFillRemaining(
                    fillOverscroll: true,
                    child: Column(
                      children: [
                        Utils.verticalPadding(),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(39.r),
                                color: AppColors.lightPurple),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: ConferenceIndicator.conferenceIndicators.length,
                                itemBuilder: (context, index) {
                                  var program = ConferenceIndicator.conferenceIndicators[index];
                                  return ProgramItemWidget(conferenceIndicator: program,
                                    programOutline: program.title == 'Sessions'
                                    ? widget.conference!.sessions
                                    : [],
                                    onTap: (){
                                    if (program.title == "Sessions") {
                                      setState(() {
                                        program.onIndicatorClicked = !program.onIndicatorClicked!;
                                      });
                                    }else {
                                      conferenceVm.joinAConference("${widget.conference?.id}");
                                    }
                                    },
                                  );
                                }
                            )
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Consumer<ConferenceProvider>(
            builder: (context, conference, child){
              return  Visibility(
                  visible: conference.isLoading,
                  child: const CustomLoader(color: AppColors.lightBlue,));
            },
          ),
        ],
      ),
    ));
  }

}
