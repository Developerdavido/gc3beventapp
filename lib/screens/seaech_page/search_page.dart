import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/custom_textfield.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
import 'package:provider/provider.dart';

import '../../components/custom_list_shimmer.dart';
import '../../components/screen_widgets/csa_logo.dart';
import '../../components/screen_widgets/empty_list_state.dart';
import '../../config/locator.dart';
import '../../constants/route.dart';
import '../../models/conference.dart';
import '../../services/router_service.dart';
import '../../view_models/auth_provider.dart';
import '../conference_screen/conference_widgets/conference_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final conferenceVm = Provider.of<ConferenceProvider>(context);
    final authVm = Provider.of<AuthProvider>(context);
    final theme = Theme.of(context);
    return Container(
      color: AppColors.onPrimaryColor,
      child: Scaffold(
        backgroundColor: AppColors.onPrimaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 23.w, vertical: 10.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      CSALogo(
                        height: 55.h,
                        width: 55.h,
                      ),
                      Spacer(),
                      Text(
                        "Conference Search",
                        style: theme.textTheme.headlineLarge!.copyWith(
                          color: AppColors.black,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                  Utils.verticalPadding(space: 16.h),
                  CustomTextField(
                    hintText: "Search Conferences",
                    fontFamily: "Metropolis",
                    enabled: false,
                    onTap: () {
                      showSearch(context: context, delegate: MySearchDelegate());
                    },
                    prefix: Icon(
                      Icons.search,
                      size: 20.sp,
                      color: AppColors.grey,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 23.w),
                    child: conferenceVm.gettingConferenceList
                        ? CustomListShimmer(
                            conferenceList: true,
                          )
                        : conferenceVm.conferences.isEmpty
                            ? EmptyListState(
                                message:
                                    "No Conferences found for you at the moment",
                              )
                            : ListView.builder(
                                itemCount: conferenceVm.conferences.length,
                                itemBuilder: (context, index) {
                                  final conference =
                                      conferenceVm.conferences[index];
                                  return GestureDetector(
                                    onTap: () {
                                      conferenceVm
                                          .setChosenConference(conference);
                                      locator<RouterService>().push(
                                          AppRoute.conferenceDetailsRoute);
                                      conferenceVm.checkIfUserIsAttendingConference(
                                              authVm.authModal!.user!.id!,
                                              conference);
                                    },
                                    child: ConferenceCard(
                                      conference: conference,
                                    ),
                                  );
                                })))
          ],
        ),
      ),
    );
  }
}

//this is the search delegate to search for conferences

class MySearchDelegate extends SearchDelegate{
  @override
  String? get searchFieldLabel => "Search Conferences";
  @override
  TextStyle? get searchFieldStyle => TextStyle (
    fontWeight: FontWeight.w500,
    color: Colors.grey,
    fontSize: 18.sp,
    decoration: null,
    letterSpacing: 1.2,
  );
  @override
  InputDecorationTheme? get searchFieldDecorationTheme => InputDecorationTheme(
    isDense: true,
    hintStyle: TextStyle(
        fontSize: 18.sp,
        color: Colors.grey,
        fontFamily: "Metropolis",
        letterSpacing: 1.2
    ),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            width: 0,
            color: Colors.transparent
        )
    ),
    outlineBorder: BorderSide(
        width: 0,
        color: Colors.transparent
    ),
    activeIndicatorBorder: BorderSide(
        width: 0,
        color: Colors.transparent
    ),
    contentPadding: EdgeInsets.symmetric(
      vertical: 20.h,
      horizontal: 16.w,
    ),
  );
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: Icon(
            Icons.clear,
            color: Colors.grey,
            size: 24.sp,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () => close(context, null),
        icon: Icon(
          Icons.arrow_back,
          color: Colors.grey,
          size: 24.sp,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final confVm = Provider.of<ConferenceProvider>(context);
    final authVm = Provider.of<AuthProvider>(context);
    List<Conference> suggestions = confVm.conferences.where((searchResult) {
      final result = searchResult.theme!.toLowerCase();
      final input = query.toLowerCase();

      return result!.contains(input);
    }).toList();
    // TODO: implement buildSuggestions
    return ListView.builder(
        itemBuilder: (context, index) {
          var conference = suggestions[index];
          return GestureDetector(
            onTap: (){
              confVm
                  .setChosenConference(conference);
              locator<RouterService>().push(
                  AppRoute.conferenceDetailsRoute);
              confVm.checkIfUserIsAttendingConference(
                  authVm.authModal!.user!.id!,
                  conference);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: ConferenceCard(
                conference: conference,
              ),
            ),
          );
        },
        itemCount: suggestions.length);
  }
}
