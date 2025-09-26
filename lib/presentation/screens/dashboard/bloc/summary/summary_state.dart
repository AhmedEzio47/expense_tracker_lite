part of 'summary_bloc.dart';

final class SummaryState extends BaseState {
  const SummaryState({
    super.status = Status.initial,
    super.failure,
    this.totalExpenses,
    this.totalIncome,
  });

  final double? totalExpenses;
  final double? totalIncome;

  SummaryState copyWith({
    Status? status,
    AppException? failure,
    double? totalExpenses,
    double? totalIncome,
  }) {
    return SummaryState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      totalExpenses: totalExpenses ?? this.totalExpenses,
      totalIncome: totalIncome ?? this.totalIncome,
    );
  }
}
