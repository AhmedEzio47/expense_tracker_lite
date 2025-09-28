part of 'expenses_bloc.dart';

final class ExpensesState extends BaseState {
  const ExpensesState({
    super.status = Status.initial,
    super.failure,
    this.expenses = const [],
    this.isListExpanded = false,
    this.filter = ExpenseFilter.monthly,
    this.totalRecords = 0,
  });

  final List<ExpenseModel> expenses;
  final bool isListExpanded;
  final ExpenseFilter filter;
  final int totalRecords;

  bool get shouldShowLoadMore =>
      status == Status.success &&
      expenses.length != totalRecords &&
      isListExpanded;

  ExpensesState copyWith({
    Status? status,
    AppException? failure,
    List<ExpenseModel>? expenses,
    bool? isListExpanded,
    ExpenseFilter? filter,
    int? totalRecords,
  }) {
    return ExpensesState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      expenses: expenses ?? this.expenses,
      isListExpanded: isListExpanded ?? this.isListExpanded,
      filter: filter ?? this.filter,
      totalRecords: totalRecords ?? this.totalRecords,
    );
  }

  @override
  List<Object?> get props =>
      super.props..addAll([expenses, isListExpanded, filter]);
}
