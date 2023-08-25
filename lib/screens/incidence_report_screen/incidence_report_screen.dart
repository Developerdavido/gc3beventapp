import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/custom_button.dart';
import 'package:gc3bapp/components/screen_widgets/csa_logo.dart';
import 'package:gc3bapp/components/screen_widgets/custom_loader.dart';
import 'package:gc3bapp/components/screen_widgets/title_text.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/screens/incidence_report_screen/incidence_report_widget/category.dart';
import 'package:gc3bapp/screens/incidence_report_screen/incidence_report_widget/message_widget.dart';
import 'package:gc3bapp/view_models/incidence_provider.dart';
import 'package:provider/provider.dart';

class IncidenceReportScreen extends StatefulWidget {
  const IncidenceReportScreen({Key? key}) : super(key: key);

  @override
  State<IncidenceReportScreen> createState() => _IncidenceReportScreenState();
}

class _IncidenceReportScreenState extends State<IncidenceReportScreen> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  IncidenceProvider? vm;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm = context.read<IncidenceProvider>();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    vm?.clearFields();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: GestureDetector(
        onTap: (){
          FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus) {
            focus.unfocus();
          }
        },
        child: SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 26.w, top: 67.h),
                      child: const TopScreen(
                        isBackIconVisible: true,
                      ),
                    ),
                    Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: SingleChildScrollView(
                            child: Form(
                              key: key,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Utils.verticalPadding(space: 63.h),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 40.h),
                                    child: const TitleText(titleText: "Report An Incident",),
                                  ),
                                  Utils.verticalPadding(space: 30.h),
                                  const Center(child: CSALogo()),
                                  Utils.verticalPadding(space: 17.h),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "We care about you and will like that you have a excellent experience at any of our events. Please inform us of any happenings you find unsettling",
                                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Utils.verticalPadding(space: 38.h),
                                  Category(),
                                  Utils.verticalPadding(space: 17.h),
                                  MessageWidget(),
                                  Utils.verticalPadding(space: 55.h),
                                  Consumer<IncidenceProvider>(
                                    builder: (context, incidenceVm, child) {
                                      return CustomButton(
                                          btnText: 'Report',
                                          onTap: (){
                                            if (incidenceVm.category!.isEmpty) {
                                              Utils.showSnackBar(message: "You must select an issue to report");
                                              return;
                                            }
                                            if (key.currentState!.validate()) {
                                              incidenceVm.reportAnIncident();
                                            }
                                          });
                                    },
                                  ),
                                  Utils.verticalPadding(space: 44.h),
                                ],
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
                Consumer<IncidenceProvider>(
                  builder: (context, incidenceVm, child){
                    return  Visibility(
                        visible: incidenceVm.isLoading,
                        child: const CustomLoader());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
