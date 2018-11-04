import 'dart:async';

import 'package:disposables/disposables.dart';

main() {
  final sink = StreamController();
  final disposable = Disposable(() => sink.close());
  disposable.dispose();
}
