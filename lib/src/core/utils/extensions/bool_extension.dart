

import 'package:chats/src/core/utils/constants/strings.dart';

extension NonNullInteger on bool? {
  bool orFalse() {
    if (this == null) {
      return Constants.falseVal;
    } else {
      return this!;
    }
  }
}
