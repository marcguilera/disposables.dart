part of 'package:disposables/disposables.dart';

class DisposableException implements Exception {
  final String message;

  DisposableException._internal(this.message);
}
