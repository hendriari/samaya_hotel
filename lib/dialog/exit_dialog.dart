import 'package:flutter/material.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Are You Sure To Exit ?',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text(
                    'Exit',
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Colors.deepPurple, fontSize: 18),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Future openDialogExit(BuildContext context) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return const ExitDialog();
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return Transform.scale(
        scale: anim1.value,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
    barrierLabel: 'Exit Dialog',
    barrierColor: Colors.black.withOpacity(0.5),
    barrierDismissible: true,
  );
}
