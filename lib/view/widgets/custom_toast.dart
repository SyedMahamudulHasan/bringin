import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


showWarningToast(FToast fToast, String toastMsg) {
  fToast.showToast(
    child: WarningToastWidget(
      toastMsg: toastMsg,
    ),
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );

  // fToast.showWarningToast(
  //     child: toast,
  //     toastDuration: Duration(seconds: 2),
  //     positionedToastBuilder: (context, child) {
  //       return Positioned(
  //         child: child,
  //         top: 16.0,
  //         left: 16.0,
  //       );
  //     });
}

showGeneralToast(FToast fToast, String toastMsg) {
  fToast.showToast(
    child: GeneralToastWidget(
      toastMsg: toastMsg,
    ),
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );
}

class WarningToastWidget extends StatefulWidget {
  const WarningToastWidget({super.key, required this.toastMsg});
  final String toastMsg;
  @override
  State<WarningToastWidget> createState() => _WarningToastWidgetState();
}

class _WarningToastWidgetState extends State<WarningToastWidget> {
  bool _isVisible = true;
  _setVisible() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        _isVisible = false;
      });
    });
  }

  @override
  void initState() {
    _setVisible();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 1),
      opacity: _isVisible ? 1.0 : 0.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.red.shade200,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Icon(Icons.error),
            const SizedBox(
              width: 12.0,
            ),
            Flexible(
              child: Text(
                widget.toastMsg,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// this will show all the general toast.
class GeneralToastWidget extends StatefulWidget {
  const GeneralToastWidget({super.key, required this.toastMsg});
  final String toastMsg;
  @override
  State<GeneralToastWidget> createState() => _GeneralToastWidgetState();
}

class _GeneralToastWidgetState extends State<GeneralToastWidget> {
  bool _isVisible = true;
  _setVisible() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        _isVisible = false;
      });
    });
  }

  @override
  void initState() {
    _setVisible();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 1),
      opacity: _isVisible ? 1.0 : 0.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xffD0BCFF),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            // const Icon(FeatherIcons.alertOctagon),
            // const SizedBox(
            //   width: 12.0,
            // ),
            Flexible(
              child: Text(
                widget.toastMsg,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}