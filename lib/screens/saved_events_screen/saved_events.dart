import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/components/screen_widgets/account_widget.dart';
import 'package:gc3bapp/components/screen_widgets/empty_list_state.dart';
import 'package:gc3bapp/components/screen_widgets/top_screen.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/constants/route.dart';
import 'package:gc3bapp/constants/utils.dart';
import 'package:gc3bapp/services/router_service.dart';
import 'package:gc3bapp/view_models/auth_provider.dart';
import 'package:provider/provider.dart';

class SavedEvents extends StatelessWidget {
  const SavedEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              Utils.verticalPadding(space: 51.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 29.w),
                child: TopScreen(
                  isBackIconVisible: false,
                  isAccountIconVisible: true,
                  accountIcon: Consumer<AuthProvider>(
                    builder: (context, auth, child){
                      return AccountWidget(
                        onAccountTap: (){
                          locator<RouterService>().push(AppRoute.profileRoute, args: auth.authModal?.user);
                        },
                      );
                    },

                  ),
                ),
              ),
              Utils.verticalPadding(space: 22.h),
            ],
          )
      ),
    );
  }
}
