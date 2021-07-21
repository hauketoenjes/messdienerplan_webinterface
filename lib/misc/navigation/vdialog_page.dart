import 'package:flutter/widgets.dart';
import 'package:vrouter/vrouter.dart';

import 'dialog_page.dart';

///
/// VDialog Page zum Benutzen in den routes vom VRouter.
///
class VDialogPage extends VPage {
  VDialogPage({
    required String path,
    required Widget widget,
  }) : super(
          path: path,
          pageBuilder: (key, child, name) =>
              DialogPage(key: key, name: name, child: child),
          widget: widget,
        );
}
