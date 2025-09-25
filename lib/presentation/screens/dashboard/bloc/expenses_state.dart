part of 'expenses_bloc.dart';

final class ExpensesState extends BaseState {
  const ExpensesState({
    super.status = Status.initial,
    super.failure,
    this.expenses = const [],
  });

  final List<ExpenseModel> expenses;

  ExpensesState copyWith({
    Status? status,
    AppException? failure,
    List<ExpenseModel>? expenses,
  }) {
    return ExpensesState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      expenses: expenses ?? this.expenses,
    );
  }
}
