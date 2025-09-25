import 'package:equatable/equatable.dart';
import 'package:expense_tracker_lite/core/custom_types/app_exception.dart';
import 'package:expense_tracker_lite/presentation/common/status.dart';

base class BaseState extends Equatable {
  const BaseState({required this.status, this.failure});

  final Status status;
  final AppException? failure;

  @override
  List<Object?> get props => [status, failure];
}
