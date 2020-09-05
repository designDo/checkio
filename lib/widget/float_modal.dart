import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FloatingModal extends StatelessWidget {
  final Widget child;

  const FloatingModal({Key key, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 32),
            SafeArea(
              bottom: false,
              child: Container(
                height: 5,
                width: 45,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
            SizedBox(height: 8),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.black12,
                              spreadRadius: 5)
                        ]),
                    child: MediaQuery.removePadding(
                        context: context, removeTop: true, child: child)),
              ),
            ),
          ]);

  }
}

Future<T> showFloatingModalBottomSheet<T>({
  @required BuildContext context,
  @required ScrollWidgetBuilder builder,
  Color backgroundColor,
}) async {
  final result = await showCustomModalBottomSheet(
      context: context,
      builder: builder,
      containerWidget: (_, animation, child) => FloatingModal(
            child: child,
          ),
      expand: true);

  return result;
}
