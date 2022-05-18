import 'package:common_widgets/common_widgets.dart';
import 'package:global_navigator/global_navigator.dart';
import 'package:injectable/injectable.dart';

import '../confirmation_dialog.dart';

@lazySingleton
class DialogManager {
  Future<DateTime?> showMinimalDatePicker() async {
    return showMinimalistDatePicker(
      context: GlobalNavigator.overlayContext!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
  }

  Future<bool> showConfirmationDialog({
    required String caption,
  }) async {
    final bool? didConfirm = await GlobalNavigator.dialog<bool>(
      ConfirmationDialog(caption: caption),
    );

    return didConfirm ?? false;
  }
}
