import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/core/theme/app_palette.dart';

showCustomDialogLoading(BuildContext dialogContext) {
  try {
    showDialog(
        context: dialogContext,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              //this right here
              child: SizedBox(
                height: 80,
                child: Center(
                  child: Row(
                    children: [
                      Lottie.asset('assets/image_loading.json'),
                      const Text(
                        'Please Wait...',
                        style: TextStyle(
                            fontSize: 15, color: AppPalette.blackColor),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  } catch (e) {
    print(e.toString());
  }
}