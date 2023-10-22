import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc3bapp/constants/colors.dart';

class CustomBottomSheet extends StatefulWidget {
  final List<Widget>? widgets;
  final Widget? titleWidget;
  final double? maxChildSize;
  const CustomBottomSheet({Key? key, this.widgets, this.titleWidget, this.maxChildSize}) : super(key: key);

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(_onChanged);
  }

  void _onChanged() {
    final currentSize = _controller.size;
    if (currentSize < 0.5) _collapse();
  }

  void _collapse() {
    _animateSheet(sheet.snapSizes!.first);
  }

  void _animateSheet(double size) {
    _controller.animateTo(size, duration: Duration(milliseconds: 50), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  DraggableScrollableSheet get sheet => (_sheet.currentWidget as DraggableScrollableSheet);


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      return DraggableScrollableSheet(
          key: _sheet,
          initialChildSize: 0.5,
          maxChildSize: widget.maxChildSize!,
          minChildSize: 0.5,
          expand: true,
          snap: true,
          snapSizes: [0.5,],
          builder: (context, scrollController){
            return DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(39.r), topRight: Radius.circular(39.r)),

                ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: widget.titleWidget,
                  ),
                  SliverList.list(children: widget.widgets!)
                ],
              ),
            );
          }
      );
    });
  }





}
