import 'package:electronic_shop/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AlertDialogBox {
  static Future showAlert({
    required BuildContext context,
    required String title,
    required String content,
    required VoidCallback confirm,
    required VoidCallback cancel,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Align(
        alignment: Alignment.topCenter,
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColors.greyColor,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: confirm,
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: 50,
                          child: Text(
                            'YES',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.black45,
                      height: 50,
                      width: .5,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: cancel,
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Text(
                            'NO',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
