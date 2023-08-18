import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';
import 'package:gc3bapp/models/pop_up_menu_item.dart';

class PostPopUpMenuBtn extends StatefulWidget {
  final List<MyPopUpMenuItem>? items;
  final Widget? child;
  final Color? menuItemColor;
  const PostPopUpMenuBtn({Key? key, this.items, this.child, this.menuItemColor}) : super(key: key);

  @override
  State<PostPopUpMenuBtn> createState() => _PostPopUpMenuBtnState();
}

class _PostPopUpMenuBtnState extends State<PostPopUpMenuBtn> {
  @override
  Widget build(BuildContext context) {
    MyPopUpMenuItem? menuItem;
    return PopupMenuButton<MyPopUpMenuItem>(
      initialValue: menuItem,
      onSelected: (item) {
        setState(() {
          menuItem = item;
        });
      },
      elevation: 2,
      offset: Offset(0.0.w, 48.0.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r)
      ),
      itemBuilder: (BuildContext context) {
        return widget.items!.map((MyPopUpMenuItem item) {
          return PopupMenuItem<MyPopUpMenuItem>(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              value: item,
              child: ListTile(
                selected: menuItem == item,
                selectedColor: AppColors.lightGrey,
                leading: Icon(item.iconData, size: 22, color: widget.menuItemColor ?? AppColors.secondaryColor,),
                title: Text(item.title!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 22,
                    color: widget.menuItemColor ?? AppColors.secondaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: menuItem == item ? null : item.onTap!,
              )
          );
        }).toList();
      },
      child: widget.child,
    );
  }
}
