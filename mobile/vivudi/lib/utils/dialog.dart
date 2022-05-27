import 'package:flutter/material.dart';

Future<T?> showConfirmDialog<T>(
  BuildContext context, {
  Widget? title,
  Widget? content,
  Widget? negative,
  Widget? positive,
  VoidCallback? onNegative,
  VoidCallback? onPositive,
}) async {
  return showDialog<T>(
      context: context,
      builder: (context) => AlertDialog(
            title: title,
            content: content,
            actionsAlignment: MainAxisAlignment.spaceAround,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            actions: <Widget>[
              InkWell(
                child: negative,
                onTap: () {
                  Navigator.pop(context, true);
                  onNegative?.call();
                },
              ),
              InkWell(
                child: positive,
                onTap: () {
                  Navigator.pop(context, true);
                  onPositive?.call();
                },
              ),
            ],
          ));
}
