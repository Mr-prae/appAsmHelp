import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oktoast/oktoast.dart';

floadMessage(
    {String? titulo,
    String? mensaje,
    Duration? duration,
    ToastPosition? toastPosition,
    double? bigHeight,
    int? maxLine,
    double? borderRadius}) {
  showToastWidget(
    BounceInDown(
      duration: Duration(milliseconds: 1000),
      child: GestureDetector(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              // height: bigHeight ?? 50,
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, .03),
                      blurRadius: 5,
                      spreadRadius: 5,
                      offset: Offset(0, 2),
                    )
                  ],
                  color: Color.fromARGB(255, 44, 43, 43),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${(titulo ?? "Mensaje: ").trim()}" ?? "",
                                maxLines: bigHeight == null ? 1 : maxLine ?? 1,

                                //  overflow: TextOverflow.clip,
                                style: TextStyle(
                                  color: Colors.white,
                                ),

                                textAlign: TextAlign.center,
                              ),
                              Container(
                                width: MediaQuery.of(Get.context!).size.width /
                                    1.3,
                                child: Text(
                                  "${mensaje!.trim()}",
                                  overflow: TextOverflow.clip,
                                  style: const TextStyle(color: Colors.white),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    position: toastPosition ?? ToastPosition.bottom,
    duration: duration ?? const Duration(seconds: 4),
  );
}

  load(BuildContext context, {bool colorSuave = false}) {
    // context = Get.context!;
    return showDialog(
        // barrierColor:
        // useSafeArea: tue,
        barrierColor: colorSuave == false
            ? const Color.fromRGBO(64, 62, 65, 0.5)
            : Colors.transparent,
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: double.infinity,
                  child: (CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    child: Align(
                        alignment: Alignment.center,
                        child: Center(
                          child: LoadingAnimationWidget.twistingDots(
                            leftDotColor: Color.fromARGB(255, 2, 82, 173),
                            rightDotColor: Color.fromARGB(255, 0, 0, 0),
                            size: 80,
                          ),
                        )),
                  )),
                ),
              ),
            ),
          );
        });
  }